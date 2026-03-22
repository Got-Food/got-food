import { useState } from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import "../styles/MenuItem.css";

export function MenuItem({ title, isOpen }) {
  const [starred, setStarred] = useState(false);
  const [active, setActive] = useState(false);

  return (
    <div
      className={`menu-item${active ? " active" : ""}`}
      onMouseDown={() => setActive(true)}
      onMouseUp={() => setActive(false)}
      onMouseLeave={() => setActive(false)}
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
        <span className="menu-item-title">{title}</span>
        <span className={`menu-item-status${isOpen ? " open" : " closed"}`}>
          {isOpen ? "Open now" : "Closed"}
        </span>
      </div>
    </div>
  );
}

export default MenuItem;
