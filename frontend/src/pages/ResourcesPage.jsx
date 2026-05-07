import { useState, useEffect } from "react";
import Navbar from "../components/Navbar";
import Header from "../components/Header";
import { createEvent, getAllEvents, deleteEvent } from "../utils/community_requests";
import { useAuth } from "../context/AuthContext";

const DIETS = ["ANY", "HALAL", "KOSHER", "VEGAN", "VEGETARIAN", "NONE"];


const defaultForm = {
  name: "",
  address: "",
  supported_diets: [],
  is_students_only: false,
  comments: "",
  date: "",
  time: "",
};

function Resources() {
  const [events, setEvents] = useState([]);
  const [form, setForm] = useState(defaultForm);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);
  const [refreshKey, setRefreshKey] = useState(0);
  const { isAdmin } = useAuth();

  const fetchEvents = async () => {
    const data = await getAllEvents();
    if (data) setEvents(data);
  };

  useEffect(() => {
    fetchEvents();
  }, [refreshKey]);

  const handleChange = (e) => {
    const { name, value, type, checked } = e.target;
    setForm((prev) => ({ ...prev, [name]: type === "checkbox" ? checked : value }));
  };

  const toggleDiet = (diet) => {
  setForm((prev) => {
    if (diet === "ANY" || diet === "NONE") {
      // If clicking ANY or NONE, deselect everything else and just select this one
      return {
        ...prev,
        supported_diets: prev.supported_diets.includes(diet) ? [] : [diet],
      };
    }
    // If clicking a regular diet, remove ANY and NONE from the selection
    const without = prev.supported_diets.filter((d) => d !== "ANY" && d !== "NONE");
    return {
      ...prev,
      supported_diets: without.includes(diet)
        ? without.filter((d) => d !== diet)
        : [...without, diet],
    };
  });
};

  const handleSubmit = async () => {
    if (!form.name || !form.address || !form.date || !form.time) {
      alert("Please fill out all required fields (name, address, date, time).");
      return;
    }

    setLoading(true);
    setError(null);

    const optional = {};
    if (form.supported_diets.length > 0) optional.supported_diets = form.supported_diets;
    if (form.comments) optional.comments = form.comments;

    const result = await createEvent(
      form.name,
      form.address,
      form.is_students_only,
      form.date,
      form.time,
      optional,
    );

    if (result.ok) {
      setRefreshKey(k => k + 1);
      setForm(defaultForm);
      window.scrollTo({ top: 0, behavior: "smooth" });
    } else {
      setError(`Failed to create event (${result.status}). Please try again.`);
    }

    setLoading(false);
  };

  const handleDelete = async (id) => {
    const success = await deleteEvent(id);
    if (success) {

      setRefreshKey(k => k + 1);
    } else {
      alert("Failed to delete event. You may not have permission.");
    }
  };

  return (
    <div style={{ display: "flex", flexDirection: "column", minHeight: "100vh", backgroundColor: "white" }}>
      <Header />
      <Navbar />
      <main style={{ maxWidth: 720, margin: "0 auto", width: "100%", padding: "2.5rem 1.5rem" }}>
        <h1 style={{ fontSize: 26, fontWeight: 600, color: "#111", marginBottom: "0.25rem" }}>
          Upcoming Events
        </h1>
        <p style={{ fontSize: 14, color: "#666", marginBottom: "1.5rem" }}>
          Events submitted below will appear here.
        </p>

        {events.length === 0 ? (
          <div style={{
            textAlign: "center", padding: "2.5rem", border: "1px dashed #d1d5db",
            borderRadius: 8, color: "#9ca3af", fontSize: 14, marginBottom: "3rem",
          }}>
            No events yet. Use the form below to add one.
          </div>
        ) : (
          <div style={{
            display: "flex", flexDirection: "column", gap: 16, marginBottom: "3rem",
            ...(events.length >= 5 && { maxHeight: 600, overflowY: "auto", paddingRight: 8 }),
          }}>
            {events.map((event) => (
              <EventCard key={event.id} event={event} onDelete={handleDelete} isAdmin={isAdmin} />
            ))}
          </div>
        )}
        <div style={{ borderTop: "1px solid #e5e7eb", marginBottom: "2.5rem" }} />

        <h2 style={{ fontSize: 22, fontWeight: 600, color: "#111", marginBottom: "0.25rem" }}>
          Add an Event
        </h2>
        <p style={{ fontSize: 14, color: "#666", marginBottom: "2rem" }}>
          Fill out the form below to add a new event to the list above.
        </p>

        {error && (
          <div style={{
            marginBottom: "1.5rem", padding: "10px 14px", backgroundColor: "#fef2f2",
            border: "1px solid #fecaca", borderRadius: 6, color: "#dc2626", fontSize: 14,
          }}>
            {error}
          </div>
        )}

        <Section title="Event Details">
          <Row full>
            <Field label="Event Name *">
              <input
                name="name"
                value={form.name}
                onChange={handleChange}
                placeholder="e.g. Community Food Drive"
                style={inputStyle}
              />
            </Field>
          </Row>
          <Row full>
            <Field label="Address *">
              <input
                name="address"
                value={form.address}
                onChange={handleChange}
                placeholder="e.g. 123 Main St, Reston, VA 20190"
                style={inputStyle}
              />
            </Field>
          </Row>
          <Row>
            <Field label="Date *">
              <input name="date" value={form.date} onChange={handleChange} type="date" style={inputStyle} />
            </Field>
            <Field label="Time *">
              <input name="time" value={form.time} onChange={handleChange} type="time" style={inputStyle} />
            </Field>
          </Row>
          <Row full>
            <Field label="Open To">
              <select name="is_students_only" value={form.is_students_only} onChange={handleChange} style={inputStyle}>
                <option value={false}>Anyone</option>
                <option value={true}>Students Only</option>
              </select>
            </Field>
          </Row>
        </Section>

        <Section title="Dietary Support">
          <div style={{ display: "flex", flexWrap: "wrap", gap: 8 }}>
            {DIETS.map((diet) => {
              const active = form.supported_diets.includes(diet);
              return (
                <button
                  key={diet}
                  type="button"
                  onClick={() => toggleDiet(diet)}
                  style={{
                    padding: "6px 14px", borderRadius: 20,
                    border: `1px solid ${active ? "#2563eb" : "#d1d5db"}`,
                    background: active ? "#eff6ff" : "white",
                    color: active ? "#1d4ed8" : "#374151",
                    fontSize: 13, cursor: "pointer", fontWeight: active ? 500 : 400,
                  }}
                >
                  {diet.charAt(0) + diet.slice(1).toLowerCase()}
                </button>
              );
            })}
          </div>
        </Section>

        <Section title="Additional Information">
          <Field label="Comments">
            <textarea
              name="comments"
              value={form.comments}
              onChange={handleChange}
              placeholder="Any extra details about this event..."
              rows={4}
              style={{ ...inputStyle, resize: "vertical" }}
            />
          </Field>
        </Section>

        <div style={{ display: "flex", justifyContent: "flex-end", marginTop: "2rem" }}>
          <button
            onClick={handleSubmit}
            disabled={loading}
            style={{
              padding: "10px 32px",
              backgroundColor: loading ? "#93c5fd" : "#2563eb",
              color: "white", border: "none", borderRadius: 8,
              fontSize: 15, fontWeight: 500,
              cursor: loading ? "not-allowed" : "pointer",
            }}
          >
            {loading ? "Saving..." : "Add Event"}
          </button>
        </div>
      </main>
    </div>
  );
}

function EventCard({ event, onDelete, isAdmin }) {
  const raw = new Date(event.date_and_time);
  const formatted = new Intl.DateTimeFormat("en-US", {
    weekday: "short",
    month: "short",
    day: "numeric",
    year: "numeric",
    hour: "numeric",
    minute: "2-digit",
    timeZone: "UTC",
  }).format(raw);

  const diets = event.supported_diets || [];

  return (
    <div style={{ border: "1px solid #e5e7eb", borderRadius: 10, padding: "1.25rem 1.5rem", backgroundColor: "white" }}>
      <div style={{ display: "flex", justifyContent: "space-between", alignItems: "flex-start" }}>
        <div>
          <h2 style={{ fontSize: 17, fontWeight: 600, color: "#111", margin: 0 }}>{event.name}</h2>
          <p style={{ fontSize: 13, color: "#6b7280", margin: "2px 0 0" }}>{event.full_address}</p>
        </div>
        {isAdmin && (<button
          onClick={() => onDelete(event.id)}
          style={{ fontSize: 12, color: "#ef4444", background: "none", border: "none", cursor: "pointer", marginLeft: 12, padding: 0 }}
        >
          Remove
        </button>)}
      </div>

      <p style={{ fontSize: 13, color: "#374151", margin: "10px 0 6px", fontWeight: 500 }}>
        📅 {formatted}
      </p>

      <div style={{ display: "flex", flexWrap: "wrap", gap: 8, margin: "8px 0" }}>
        <span style={{ fontSize: 12, padding: "3px 10px", borderRadius: 20, backgroundColor: "#f0fdf4", color: "#166534", border: "1px solid #bbf7d0" }}>
          {event.is_students_only ? "Students only" : "Open to anyone"}
        </span>
        {diets.map((diet) => (
          <span key={diet} style={{ fontSize: 12, padding: "3px 10px", borderRadius: 20, backgroundColor: "#eff6ff", color: "#1d4ed8", border: "1px solid #bfdbfe" }}>
            {diet.charAt(0) + diet.slice(1).toLowerCase()}
          </span>
        ))}
      </div>

      {event.comments && (
        <p style={{ fontSize: 13, color: "#6b7280", marginTop: 8, marginBottom: 0, borderTop: "1px solid #f3f4f6", paddingTop: 10 }}>
          Additional Info: {event.comments}
        </p>
      )}
    </div>
  );
}

// Section, Row, Field, inputStyle unchanged...
function Section({ title, children }) {
  return (
    <div style={{ marginBottom: "1.75rem" }}>
      <p style={{ fontSize: 11, fontWeight: 600, letterSpacing: "0.08em", textTransform: "uppercase", color: "#9ca3af", marginBottom: "0.75rem", paddingBottom: "0.5rem", borderBottom: "1px solid #f3f4f6" }}>
        {title}
      </p>
      {children}
    </div>
  );
}

function Row({ children, full }) {
  return (
    <div style={{ display: "grid", gridTemplateColumns: full ? "1fr" : "1fr 1fr", gap: 12, marginBottom: 12 }}>
      {children}
    </div>
  );
}

function Field({ label, children }) {
  return (
    <div style={{ display: "flex", flexDirection: "column", gap: 5 }}>
      <label style={{ fontSize: 13, color: "#6b7280" }}>{label}</label>
      {children}
    </div>
  );
}

const inputStyle = {
  width: "100%", padding: "8px 10px", fontSize: 14,
  border: "1px solid #d1d5db", borderRadius: 6, color: "#111",
  backgroundColor: "white", boxSizing: "border-box", outline: "none",
};

export default Resources;