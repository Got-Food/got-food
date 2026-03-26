import { useEffect } from "react";
import { MapContainer, TileLayer, Marker, Popup, useMap } from "react-leaflet";
import "leaflet/dist/leaflet.css";
import L from "leaflet";

import markerIcon2x from "leaflet/dist/images/marker-icon-2x.png";
import markerIcon from "leaflet/dist/images/marker-icon.png";
import markerShadow from "leaflet/dist/images/marker-shadow.png";

delete L.Icon.Default.prototype._getIconUrl;
L.Icon.Default.mergeOptions({
  iconRetinaUrl: markerIcon2x,
  iconUrl: markerIcon,
  shadowUrl: markerShadow,
});

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

function DisplayMap({ pantries, selectedPantry, onSelectPantry }) {
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
  }));

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
        {pantryLocations.map((loc, index) => (
          <Marker
            key={index}
            position={loc.position}
            eventHandlers={{
              click: (e) => {
                e.target._map.flyTo(loc.position, 13, { duration: 1.2 });
                onSelectPantry?.(loc.id);
              },
            }}
          ></Marker>
        ))}
      </MapContainer>
    </div>
  );
}

export default DisplayMap;
