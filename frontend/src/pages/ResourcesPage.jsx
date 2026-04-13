import { useState } from "react";
import Navbar from "../components/Navbar";
import Header from "../components/Header";

const DIETS = ["ANY", "HALAL", "KOSHER", "VEGAN", "VEGETARIAN", "NONE"];

const defaultForm = {
  name: "",
  location: "",
  supported_diets: [],
  open_to: "anyone",
  additional_info: "",
  date: "",
  time: "",
};

function Resources() {
  const [events, setEvents] = useState([]);
  const [form, setForm] = useState(defaultForm);

  // Each event object looks like:
  // {
  //   id: number,
  //   name: string,
  //   location: string,
  //   supported_diets: string[],
  //   open_to: "anyone" | "students",
  //   additional_info: string,
  //   date: string,   // "YYYY-MM-DD"
  //   time: string,   // "HH:MM"
  // }

  const handleChange = (e) => {
    const { name, value } = e.target;
    setForm((prev) => ({ ...prev, [name]: value }));
  };

  const toggleDiet = (diet) => {
    setForm((prev) => ({
      ...prev,
      supported_diets: prev.supported_diets.includes(diet)
        ? prev.supported_diets.filter((d) => d !== diet)
        : [...prev.supported_diets, diet],
    }));
  };

  const handleSubmit = () => {
    if (!form.name || !form.location || !form.date || !form.time) {
      alert("Please fill out all required fields (name, location, date, time).");
      return;
    }
    setEvents((prev) => [...prev, { ...form, id: Date.now() }]);
    setForm(defaultForm);
    window.scrollTo({ top: 0, behavior: "smooth" });
  };

  const handleDelete = (id) => {
    setEvents((prev) => prev.filter((e) => e.id !== id));
  };

  return (
    <div style={{ display: "flex", flexDirection: "column", minHeight: "100vh", backgroundColor: "white" }}>
      <Header />
      <Navbar />
      <main style={{ maxWidth: 720, margin: "0 auto", width: "100%", padding: "2.5rem 1.5rem" }}>

        {/* EVENT LIST */}
        <h1 style={{ fontSize: 26, fontWeight: 600, color: "#111", marginBottom: "0.25rem" }}>
          Upcoming Events
        </h1>
        <p style={{ fontSize: 14, color: "#666", marginBottom: "1.5rem" }}>
          Events submitted below will appear here.
        </p>

        {events.length === 0 ? (
          <div style={{
            textAlign: "center",
            padding: "2.5rem",
            border: "1px dashed #d1d5db",
            borderRadius: 8,
            color: "#9ca3af",
            fontSize: 14,
            marginBottom: "3rem",
          }}>
            No events yet. Use the form below to add one.
          </div>
        ) : (
          <div style={{ display: "flex", flexDirection: "column", gap: 16, marginBottom: "3rem" }}>
            {events.map((event) => (
              <EventCard key={event.id} event={event} onDelete={handleDelete} />
            ))}
          </div>
        )}

        {/* DIVIDER */}
        <div style={{ borderTop: "1px solid #e5e7eb", marginBottom: "2.5rem" }} />

        {/* FORM */}
        <h2 style={{ fontSize: 22, fontWeight: 600, color: "#111", marginBottom: "0.25rem" }}>
          Add an Event
        </h2>
        <p style={{ fontSize: 14, color: "#666", marginBottom: "2rem" }}>
          Fill out the form below to add a new event to the list above.
        </p>

        <Section title="Event Details">
          <Row full>
            <Field label="Event Name *">
              <input name="name" value={form.name} onChange={handleChange} placeholder="e.g. Community Food Drive" style={inputStyle} />
            </Field>
          </Row>
          <Row full>
            <Field label="Location *">
              <input name="location" value={form.location} onChange={handleChange} placeholder="e.g. 123 Main St, Reston, VA" style={inputStyle} />
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
              <select name="open_to" value={form.open_to} onChange={handleChange} style={inputStyle}>
                <option value="anyone">Anyone</option>
                <option value="students">Students Only</option>
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
                    padding: "6px 14px",
                    borderRadius: 20,
                    border: `1px solid ${active ? "#2563eb" : "#d1d5db"}`,
                    background: active ? "#eff6ff" : "white",
                    color: active ? "#1d4ed8" : "#374151",
                    fontSize: 13,
                    cursor: "pointer",
                    fontWeight: active ? 500 : 400,
                  }}
                >
                  {diet.charAt(0) + diet.slice(1).toLowerCase()}
                </button>
              );
            })}
          </div>
        </Section>

        <Section title="Additional Information">
          <Field label="Additional Info">
            <textarea
              name="additional_info"
              value={form.additional_info}
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
            style={{ padding: "10px 32px", backgroundColor: "#2563eb", color: "white", border: "none", borderRadius: 8, fontSize: 15, fontWeight: 500, cursor: "pointer" }}
          >
            Add Event
          </button>
        </div>
      </main>
    </div>
  );
}

function EventCard({ event, onDelete }) {
  const formatted = new Date(`${event.date}T${event.time}`).toLocaleString("en-US", {
    weekday: "short", month: "short", day: "numeric",
    year: "numeric", hour: "numeric", minute: "2-digit",
  });

  return (
    <div style={{ border: "1px solid #e5e7eb", borderRadius: 10, padding: "1.25rem 1.5rem", backgroundColor: "white" }}>
      <div style={{ display: "flex", justifyContent: "space-between", alignItems: "flex-start" }}>
        <div>
          <h2 style={{ fontSize: 17, fontWeight: 600, color: "#111", margin: 0 }}>{event.name}</h2>
          <p style={{ fontSize: 13, color: "#6b7280", margin: "2px 0 0" }}>{event.location}</p>
        </div>
        <button
          onClick={() => onDelete(event.id)}
          style={{ fontSize: 12, color: "#ef4444", background: "none", border: "none", cursor: "pointer", marginLeft: 12, padding: 0 }}
        >
          Remove
        </button>
      </div>

      <p style={{ fontSize: 13, color: "#374151", margin: "10px 0 6px", fontWeight: 500 }}>📅 {formatted}</p>

      <div style={{ display: "flex", flexWrap: "wrap", gap: 8, margin: "8px 0" }}>
        <span style={{ fontSize: 12, padding: "3px 10px", borderRadius: 20, backgroundColor: "#f0fdf4", color: "#166534", border: "1px solid #bbf7d0" }}>
          {event.open_to === "students" ? "Students only" : "Open to anyone"}
        </span>
        {event.supported_diets.map((diet) => (
          <span key={diet} style={{ fontSize: 12, padding: "3px 10px", borderRadius: 20, backgroundColor: "#eff6ff", color: "#1d4ed8", border: "1px solid #bfdbfe" }}>
            {diet.charAt(0) + diet.slice(1).toLowerCase()}
          </span>
        ))}
      </div>

      {event.additional_info && (
        <p style={{ fontSize: 13, color: "#6b7280", marginTop: 8, marginBottom: 0, borderTop: "1px solid #f3f4f6", paddingTop: 10 }}>
          {event.additional_info}
        </p>
      )}
    </div>
  );
}

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
  width: "100%",
  padding: "8px 10px",
  fontSize: 14,
  border: "1px solid #d1d5db",
  borderRadius: 6,
  color: "#111",
  backgroundColor: "white",
  boxSizing: "border-box",
  outline: "none",
};

export default Resources;