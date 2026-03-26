import { createPortal } from "react-dom";
import "../styles/PantryInfoModal.css";
import { getPantryStatus } from "../utils/get_pantry_status";
import { MdEmail, MdPhone } from "react-icons/md";
import { HiOutlineLocationMarker } from "react-icons/hi";
import { IoLink } from "react-icons/io5";
import { FaRegCommentDots, FaClock } from "react-icons/fa";

const DAYS_ORDER = [
  "MONDAY",
  "TUESDAY",
  "WEDNESDAY",
  "THURSDAY",
  "FRIDAY",
  "SATURDAY",
  "SUNDAY",
];

export function PantryInfoModal({ details, onClose }) {
  if (!details) return null;

  const {
    name,
    address,
    city,
    zip,
    url,
    phone,
    email,
    comments,
    hours,
    state,
  } = details;

  const status = getPantryStatus(hours);

  const today = new Date();
  const todayName = [
    "SUNDAY",
    "MONDAY",
    "TUESDAY",
    "WEDNESDAY",
    "THURSDAY",
    "FRIDAY",
    "SATURDAY",
  ][today.getDay()];

  const sortedHours = DAYS_ORDER.map((day) =>
    hours?.find((h) => h.day_of_week === day),
  ).filter(Boolean);

  const statusLabel = {
    open: { text: "Open", className: "status-open" },
    closed: { text: "Closed", className: "status-closed" },
    varied: { text: "Hours Varied", className: "status-varied" },
  }[status] ?? { text: "Status Unknown", className: "status-unknown" };

  return createPortal(
    <div className="pantry-modal-overlay" onClick={onClose}>
      <div className="pantry-modal" onClick={(e) => e.stopPropagation()}>
        <button className="pantry-modal-close" onClick={onClose}>
          ✕
        </button>

        {/* Name */}
        <h1 className="pantry-modal-name">{name}</h1>

        <div className="pantry-modal-body">
          {/* Location */}
          <div className="pantry-modal-section">
            <span className="pantry-modal-icon">
              <HiOutlineLocationMarker />
            </span>
            <span className="pantry-modal-value">
              <span className="pantry-location-line">{address}</span>
              <span className="pantry-location-line">
                {city}, {state}, {zip}
              </span>
            </span>
          </div>

          {/* Hours */}
          {sortedHours.length > 0 && (
            <div className="pantry-modal-section pantry-modal-section--hours">
              <div className="pantry-hours-header">
                <span className="pantry-modal-icon">
                  <FaClock />
                </span>
                {status && (
                  <span
                    className={`pantry-status-text ${statusLabel.className}`}
                  >
                    {statusLabel.text}
                  </span>
                )}
              </div>
              <div className="pantry-hours-grid">
                {sortedHours.map((h) => {
                  const isToday = h.day_of_week === todayName;
                  const dayLabel =
                    h.day_of_week.charAt(0) +
                    h.day_of_week.slice(1).toLowerCase();
                  let hoursText;
                  if (
                    h.status === "CLOSED" ||
                    (!h.open_time && !h.close_time)
                  ) {
                    hoursText = "Closed";
                  } else if (h.open_time && !h.close_time) {
                    hoursText = `${h.open_time} \u2013 VARIES`;
                  } else if (!h.open_time && h.close_time) {
                    hoursText = `Until ${h.close_time}`;
                  } else {
                    hoursText = `${h.open_time} \u2013 ${h.close_time}`;
                  }

                  return (
                    <div
                      key={h.day_of_week}
                      className={`pantry-hours-row ${isToday ? "pantry-hours-today" : ""}`}
                    >
                      <span className="pantry-hours-day">{dayLabel}</span>
                      <span className="pantry-hours-time">{hoursText}</span>
                    </div>
                  );
                })}
              </div>
            </div>
          )}

          {/* Website */}
          {url && (
            <div className="pantry-modal-section">
              <span className="pantry-modal-icon">
                <IoLink />
              </span>
              <a
                className="pantry-modal-link"
                href={url}
                target="_blank"
                rel="noopener noreferrer"
              >
                {url}
              </a>
            </div>
          )}

          {/* Phone */}
          {phone && (
            <div className="pantry-modal-section">
              <span className="pantry-modal-icon">
                <MdPhone />
              </span>
              <a className="pantry-modal-link" href={`tel:${phone}`}>
                {phone}
              </a>
            </div>
          )}

          {/* Email */}
          {email && (
            <div className="pantry-modal-section">
              <span className="pantry-modal-icon">
                <MdEmail />
              </span>
              <a className="pantry-modal-link" href={`mailto:${email}`}>
                {email}
              </a>
            </div>
          )}

          {/* Comments */}
          {comments && (
            <div className="pantry-modal-section">
              <span className="pantry-modal-icon">
                <FaRegCommentDots />
              </span>
              <span className="pantry-modal-value pantry-modal-comments">
                {comments}
              </span>
            </div>
          )}
        </div>
      </div>
    </div>,
    document.body,
  );
}

export default PantryInfoModal;
