import { useState } from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faMap } from "@fortawesome/free-solid-svg-icons";
import "../styles/MenuItem.css";
import { getCurrentDay } from "../utils/get_current_day";
import { PantryInfoModal } from "./PantryInfoModal";

export function MenuItem({ details, flash, onSelect }) {
  const today = getCurrentDay();
  const todayHours = details.hours?.find((h) => h.day_of_week === today);
  const status =
    !todayHours || todayHours.status === "CLOSED"
      ? "closed"
      : details.has_variable_hours
        ? "varied"
        : "open";
  const statusLabel =
    { open: "Open", closed: "Closed", varied: "Hours Varied" }[status] ??
    "Closed";

  const [starred, setStarred] = useState(false);
  const [active, setActive] = useState(false);
  const [showInfo, setShowInfo] = useState(false);

  return (
    <>
      <div
        id={`pantry-${details.id}`}
        className={`menu-item${active ? " active" : ""}${flash ? " flash" : ""}`}
        onMouseDown={() => setActive(true)}
        onMouseUp={() => setActive(false)}
        onMouseLeave={() => setActive(false)}
        onClick={(e) => {
          e.stopPropagation();
          setShowInfo(true);
        }}
      >
        <button
          className={`menu-item-star-btn${starred ? " starred" : ""}`}
          onClick={(e) => {
            e.stopPropagation();
            setStarred((s) => !s);
          }}
          title={starred ? "Remove from favorites" : "Add to favorites"}
        >
          <FontAwesomeIcon
            className="menu-item-star-icon"
            icon={starred ? "fa-solid fa-star" : "fa-regular fa-star"}
          />
        </button>

        <div className="menu-item-text">
          <span className="menu-item-title">{details.name}</span>
          <span className={`menu-item-status ${status ?? "closed"}`}>
            {statusLabel}
          </span>
        </div>

        <button
          className="menu-item-info-btn"
          onClick={(e) => {
            e.stopPropagation();
            onSelect?.();
          }}
          title="Select pantry"
        >
          <FontAwesomeIcon className="menu-item-info-icon" icon={faMap} />
        </button>
      </div>

      {showInfo && (
        <PantryInfoModal details={details} onClose={() => setShowInfo(false)} />
      )}
    </>
  );
}

export default MenuItem;
