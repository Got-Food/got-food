import { useEffect, useRef } from "react";
import { MapContainer, TileLayer, useMap } from "react-leaflet";
import "leaflet/dist/leaflet.css";
import "leaflet.markercluster/dist/MarkerCluster.css";
import "leaflet.markercluster/dist/MarkerCluster.Default.css";
import L from "leaflet";
import "leaflet.markercluster";

import markerIcon2x from "leaflet/dist/images/marker-icon-2x.png";
import markerIcon from "leaflet/dist/images/marker-icon.png";
import markerShadow from "leaflet/dist/images/marker-shadow.png";

import { getCurrentDay } from "../utils/get_current_day";
import { getOpenStatus } from "../utils/get_open_status";

delete L.Icon.Default.prototype._getIconUrl;
L.Icon.Default.mergeOptions({
  iconRetinaUrl: markerIcon2x,
  iconUrl: markerIcon,
  shadowUrl: markerShadow,
});

const STATUS_ICONS = {
  open: new L.Icon({
    iconUrl:
      "https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-green.png",
    shadowUrl: markerShadow,
    iconSize: [25, 41],
    iconAnchor: [12, 41],
    popupAnchor: [1, -34],
  }),
  closed: new L.Icon({
    iconUrl:
      "https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-red.png",
    shadowUrl: markerShadow,
    iconSize: [25, 41],
    iconAnchor: [12, 41],
    popupAnchor: [1, -34],
  }),
  varied: new L.Icon({
    iconUrl:
      "https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-orange.png",
    shadowUrl: markerShadow,
    iconSize: [25, 41],
    iconAnchor: [12, 41],
    popupAnchor: [1, -34],
  }),
};

function FlyToMarker({ selectedPantry }) {
  const map = useMap();
  useEffect(() => {
    if (selectedPantry) {
      map.flyTo(
        [
          parseFloat(selectedPantry.latitude),
          parseFloat(selectedPantry.longitude),
        ],
        13,
        { duration: 1.2 },
      );
    }
  }, [selectedPantry, map]);
  return null;
}

function FlyToSearch({ searchCoords }) {
  const map = useMap();
  useEffect(() => {
    if (searchCoords?.lat && searchCoords?.lon) {
      map.flyTo(
        [parseFloat(searchCoords.lat), parseFloat(searchCoords.lon)],
        12,
        { duration: 1.2 },
      );
    }
  }, [searchCoords, map]);
  return null;
}

function ClusteredMarkers({ pantries, onSelectPantry }) {
  const map = useMap();
  // Keep a ref so we can remove the old cluster group when pantries change.
  const clusterGroupRef = useRef(null);
  const todayName = getCurrentDay();

  useEffect(() => {
    // Clean up any previous cluster group before re-adding.
    if (clusterGroupRef.current) {
      map.removeLayer(clusterGroupRef.current);
    }

    const clusterGroup = L.markerClusterGroup({
      // Setting this to really low but it doesn't seems to change anything, can experiment with this more later
      spiderfyDistanceMultiplier: 0.05,
      showCoverageOnHover: false, // hide the polygon drawn around a cluster on hover
      spiderfyOnMaxZoom: true, // spiderfy instead of zooming further at max zoom
      maxClusterRadius: 5, // px radius within which markers get clustered

      iconCreateFunction: (cluster) => {
        const statuses = cluster
          .getAllChildMarkers()
          .map((m) => m.options._status);

        const dominantStatus = statuses.some((s) => s === "open")
          ? // Green = one of the pantries is open
            // Yellow = one of the pantry has varied hours but none of them are open
            // Red = all of the pantries in cluter is closed
            "open"
          : statuses.some((s) => s === "varied")
            ? "varied"
            : "closed";

        const colors = {
          // Eye dropped hex from the three marker images above, change these if the markers are changed.
          open: "#33b62a",
          closed: "#d14157",
          varied: "#d38b3e",
        };
        const color = colors[dominantStatus];

        return L.divIcon({
          html: `<div style="background:${color};color:white;border-radius:50%;width:36px;height:36px;display:flex;align-items:center;justify-content:center;font-weight:bold;font-size:13px;box-shadow:0 1px 4px rgba(0,0,0,0.4);">${cluster.getChildCount()}</div>`,
          className: "",
          iconSize: [36, 36],
          iconAnchor: [18, 18],
        });
      },
    });

    (pantries ?? []).forEach((p) => {
      const status = getOpenStatus(
        { hours: p.hours, has_variable_hours: p.has_variable_hours },
        todayName,
      );
      const icon = STATUS_ICONS[status] ?? STATUS_ICONS.closed;

      const marker = L.marker(
        [parseFloat(p.latitude), parseFloat(p.longitude)],
        { icon },
      );

      marker.on("click", () => {
        map.flyTo([parseFloat(p.latitude), parseFloat(p.longitude)], 13, {
          duration: 1.2,
        });
        onSelectPantry?.(p.id);
      });

      clusterGroup.addLayer(marker);
    });

    map.addLayer(clusterGroup);
    clusterGroupRef.current = clusterGroup;

    return () => {
      map.removeLayer(clusterGroup);
    };
  }, [pantries, map, onSelectPantry, todayName]);

  return null;
}

function DisplayMap({
  pantries,
  selectedPantry,
  onSelectPantry,
  searchCoords,
}) {
  const DEFAULT_CENTER = [38.8462, -77.3064];
  const DEFAULT_ZOOM = 12;

  return (
    <div style={{ width: "30vw", height: "30vw" }}>
      <MapContainer
        center={DEFAULT_CENTER}
        zoom={DEFAULT_ZOOM}
        scrollWheelZoom={true}
        style={{ height: "100%", width: "100%" }}
        whenReady={(map) => {
          const locations = (pantries ?? []).map((p) => [
            parseFloat(p.latitude),
            parseFloat(p.longitude),
          ]);
          if (locations.length > 0) {
            map.target.fitBounds(locations, { padding: [10, 10] });
          }
        }}
      >
        <TileLayer
          attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
          url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
        />
        <FlyToMarker selectedPantry={selectedPantry} />
        <FlyToSearch searchCoords={searchCoords} />
        <ClusteredMarkers pantries={pantries} onSelectPantry={onSelectPantry} />
      </MapContainer>
    </div>
  );
}

export default DisplayMap;
