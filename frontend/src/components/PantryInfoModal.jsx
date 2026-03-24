import { createPortal } from "react-dom";
import "../styles/PantryInfoModal.css";

export function PantryInfoModal({ details, onClose }) {
  console.log("modal details:", details); // verify data is coming through

  return createPortal(
    <div className="menu-item-modal-overlay" onClick={onClose}>
      <div className="menu-item-modal" onClick={(e) => e.stopPropagation()}>
        <button className="menu-item-modal-close" onClick={onClose}>
          ✕
        </button>
        <pre>{JSON.stringify(details, null, 2)}</pre>
      </div>
    </div>,
    document.body,
  );
}

export default PantryInfoModal;
