import { createPortal } from "react-dom";
import "../styles/PantryInfoModal.css";
import { getCurrentDay } from "../utils/get_current_day";
import { MdEmail, MdPhone } from "react-icons/md";
import { HiOutlineLocationMarker } from "react-icons/hi";
import { IoLink } from "react-icons/io5";
import { FaRegCommentDots, FaClock } from "react-icons/fa";
import { getOpenStatus } from "../utils/get_open_status";
import { STATUS_LABELS } from "../utils/get_open_status";

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

  const todayName = getCurrentDay();
  const status = getOpenStatus(details, todayName);

  const sortedHours = DAYS_ORDER.map((day) =>
    details.hours?.find((h) => h.day_of_week === day),
  ).filter(Boolean);

  const statusLabel = {
    open: { text: STATUS_LABELS.open, className: "status-open" },
    closed: { text: STATUS_LABELS.closed, className: "status-closed" },
    varied: { text: STATUS_LABELS.varied, className: "status-varied" },
  }[status] ?? { text: "Status Unknown", className: "status-unknown" };

  return createPortal(
    <div className="pantry-modal-overlay" onClick={onClose}>
      <div className="pantry-modal" onClick={(e) => e.stopPropagation()}>
        <button className="pantry-modal-close" onClick={onClose}>
          ✕
        </button>

        {/* Name */}
        <h1 className="pantry-modal-name">{details.name}</h1>

        <div className="pantry-modal-body">
          {/* Location */}
          <div
            className="pantry-modal-section"
            style={{
              justifyContent: "space-between",
              alignItems: "flex-start",
            }}
          >
            <div style={{ display: "flex", alignItems: "flex-start" }}>
              <span className="pantry-modal-icon">
                <HiOutlineLocationMarker />
              </span>
              <span className="pantry-modal-value">
                <span className="pantry-location-line">{details.address}</span>
                <span className="pantry-location-line">
                  {details.city}, {details.state}, {details.zip}
                </span>
              </span>
            </div>
            <a
              href={`https://www.google.com/maps?q=${details.latitude},${details.longitude}`}
              target="_blank"
              rel="noopener noreferrer"
              className="pantry-directions-link"
            >
              Get Directions
            </a>
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
          {details.url && (
            <div className="pantry-modal-section">
              <span className="pantry-modal-icon">
                <IoLink />
              </span>
              <a
                className="pantry-modal-link"
                href={details.url}
                target="_blank"
                rel="noopener noreferrer"
              >
                {details.url}
              </a>
            </div>
          )}

          {/* Phone */}
          {details.phone && (
            <div className="pantry-modal-section">
              <span className="pantry-modal-icon">
                <MdPhone />
              </span>
              <a className="pantry-modal-link" href={`tel:${details.phone}`}>
                {details.phone}
              </a>
            </div>
          )}

          {/* Email */}
          {details.email && (
            <div className="pantry-modal-section">
              <span className="pantry-modal-icon">
                <MdEmail />
              </span>
              <a className="pantry-modal-link" href={`mailto:${details.email}`}>
                {details.email}
              </a>
            </div>
          )}

          {/* Comments */}
          {details.comments && (
            <div className="pantry-modal-section">
              <span className="pantry-modal-icon">
                <FaRegCommentDots />
              </span>
              <span className="pantry-modal-value pantry-modal-comments">
                {details.comments}
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
