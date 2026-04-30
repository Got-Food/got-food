import { useEffect } from "react";
import { MapContainer, TileLayer, Marker, useMap } from "react-leaflet";
import "leaflet/dist/leaflet.css";
import L from "leaflet";

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

function DisplayMap({
  pantries,
  selectedPantry,
  onSelectPantry,
  searchCoords,
}) {
  const DEFAULT_CENTER = [38.8462, -77.3064];
  const DEFAULT_ZOOM = 12;

  const pantryLocations = (pantries ?? []).map((p) => ({
    id: p.id,
    position: [p.latitude, p.longitude],
    name: p.name,
    address: p.address,
    url: p.url,
    phone: p.phone,
    email: p.email,
    comments: p.comments,
    hours: p.hours,
    has_variable_hours: p.has_variable_hours,
  }));

  const todayName = getCurrentDay();

  return (
    <div style={{ width: "30vw", height: "30vw" }}>
      <MapContainer
        center={DEFAULT_CENTER}
        zoom={DEFAULT_ZOOM}
        scrollWheelZoom={true}
        style={{ height: "100%", width: "100%" }}
        whenReady={(map) => {
          if (pantryLocations.length > 0) {
            map.target.fitBounds(
              pantryLocations.map((loc) => loc.position),
              { padding: [10, 10] },
            );
          }
        }}
      >
        <TileLayer
          attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
          url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
        />
        <FlyToMarker selectedPantry={selectedPantry} />
        <FlyToSearch searchCoords={searchCoords} />
        {pantryLocations.map((loc, index) => {
          const status = getOpenStatus(loc, todayName);
          const icon = STATUS_ICONS[status] ?? STATUS_ICONS.closed;

          return (
            <Marker
              key={index}
              position={loc.position}
              icon={icon}
              eventHandlers={{
                click: (e) => {
                  e.target._map.flyTo(loc.position, 13, { duration: 1.2 });
                  onSelectPantry?.(loc.id);
                },
              }}
            />
          );
        })}
      </MapContainer>
    </div>
  );
}

export default DisplayMap;
