import { useEffect, useState } from "react";
import { getAllPantries, getPantriesOpenNow } from "../utils/api_requests";
import { MapContainer, TileLayer, Marker, Popup, useMap } from "react-leaflet";
import "leaflet/dist/leaflet.css";
import L from "leaflet";

import markerIcon2x from "leaflet/dist/images/marker-icon-2x.png";
import markerIcon from "leaflet/dist/images/marker-icon.png";
import markerShadow from "leaflet/dist/images/marker-shadow.png";
import { MdEmail, MdPhone } from "react-icons/md";
import { HiOutlineLocationMarker } from "react-icons/hi";
import { IoLink } from "react-icons/io5";
import { FaRegCommentDots, FaClock } from "react-icons/fa";
import { getPantryStatus } from "../utils/get_pantry_status";

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

function DisplayMap({ selectedPantry, onSelectPantry }) {
  const [pantryLocations, setPantryLocations] = useState([]);
  const [openPantries, setOpenPantries] = useState([]);
  useEffect(() => {
    // Define wrapper function to handle async behavior
    async function setFromAPI() {
      const pantries = await getAllPantries();
      const open = await getPantriesOpenNow();
      let locations = [];
      for (let p of pantries) {
        locations.push({
          id: p["id"],
          position: [p["latitude"], p["longitude"]],
          name: p["name"],
          address: p["address"],
          url: p["url"],
          phone: p["phone"],
          email: p["email"],
          comments: p["comments"],
          hours: p["hours"],
        });
      }
      setPantryLocations(locations);
      setOpenPantries(open);
    }
    setFromAPI();
  }, []); // NOTE: No dependency only runs this effect on page load, for now.

  if (pantryLocations.length === 0) return <>Loading...</>;

  return (
    <div style={{ width: "30vw", height: "30vw" }}>
      <MapContainer
        center={pantryLocations[0].position}
        zoom={14}
        scrollWheelZoom={true}
        style={{ height: "100%", width: "100%" }}
        whenReady={(map) => {
          const bounds = pantryLocations.map((loc) => loc.position);
          map.target.fitBounds(bounds, { padding: [10, 10] });
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
          >
            {/* <Popup maxWidth={420} maxHeight={550}>
              {PopupText(loc, openPantries)}
            </Popup> */}
          </Marker>
        ))}
      </MapContainer>
    </div>
  );
}

function PopupText(loc, openPantries) {
  if (!loc.name) {
    loc.name = "none";
  }
  if (!loc.address) {
    loc.address = "none";
  }
  if (!loc.url) {
    loc.url = "none";
  }
  if (!loc.phone) {
    loc.phone = "none";
  }
  if (!loc.email) {
    loc.email = "none";
  }
  if (!loc.comments) {
    loc.comments = "none";
  }
  const status = getPantryStatus(loc.hours);
  const statusLabel =
    { open: "Open", closed: "Closed", varied: "Varied hours" }[status] ??
    "Closed";

  return (
    <div
      style={{
        width: "400px",
        maxHeight: "600px",
        overflowY: "auto",
        overflowX: "hidden",
      }}
    >
      <h3> {loc.name} </h3>
      <p>
        {" "}
        <HiOutlineLocationMarker size={20} /> :{"   "} {loc.address}
      </p>
      <div>
        <h3
          style={{
            margin: "2px 0",
            color:
              { Open: "green", Closed: "red", "Varied hours": "orange" }[
                statusLabel
              ] ?? "red",
          }}
        >
          <FaClock /> {statusLabel}
        </h3>
        {loc.hours &&
          loc.hours.map((h) => (
            <p key={h.id} style={{ margin: "2px 0" }}>
              &emsp; {h.day_of_week}:{" "}
              {h.status === "CLOSED"
                ? "Closed"
                : `${h.open_time} - ${h.close_time ?? "varies"}`}
            </p>
          ))}
        {!loc.hours && <p>HOURS UNKNOWN</p>}
      </div>
      <p>
        {" "}
        <IoLink size={20} /> :{"   "}
        <a href={loc.url} target="_blank">
          {" "}
          {loc.url}
        </a>
      </p>
      <p>
        {" "}
        <MdPhone size={20} /> :{"   "}
        {loc.phone}
      </p>
      <p>
        {" "}
        <MdEmail size={20} /> :{"   "}
        {loc.email}
      </p>
      <p style={{ paddingLeft: "1.5rem" }}>
        <FaRegCommentDots size={20} style={{ marginLeft: "-1.5rem" }} /> :
        {"   "}
        {loc.comments}
      </p>
    </div>
  );
}
export default DisplayMap;
