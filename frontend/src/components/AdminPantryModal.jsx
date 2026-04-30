import { useState } from "react";
import { createPortal } from "react-dom";
import { addPantry, updatePantry } from "../utils/api_requests";
import "../styles/Auth.css";

const FIELDS = [
  { name: "name",     label: "Name",      required: true },
  { name: "url",      label: "Website URL", required: true },
  { name: "address",  label: "Address",   required: true },
  { name: "city",     label: "City",      required: true },
  { name: "state",    label: "State (2-letter)", required: true, maxLength: 2 },
  { name: "zip",      label: "ZIP Code",  required: true },
  { name: "latitude", label: "Latitude",  required: true, type: "number" },
  { name: "longitude",label: "Longitude", required: true, type: "number" },
  { name: "phone",    label: "Phone",     required: false },
  { name: "email",    label: "Email",     required: false },
  { name: "comments", label: "Comments",  required: false, multiline: true },
];

function emptyForm() {
  return { name: "", url: "", address: "", city: "", state: "", zip: "",
           latitude: "", longitude: "", phone: "", email: "", comments: "",
           has_variable_hours: false, supported_diets: [], eligibility: "" };
}

function pantryToForm(p) {
  return {
    name: p.name ?? "",
    url: p.url ?? "",
    address: p.address ?? "",
    city: p.city ?? "",
    state: p.state ?? "",
    zip: p.zip ?? "",
    latitude: p.latitude ?? "",
    longitude: p.longitude ?? "",
    phone: p.phone ?? "",
    email: p.email ?? "",
    comments: p.comments ?? "",
    has_variable_hours: p.has_variable_hours ?? false,
    supported_diets: p.supported_diets ?? [],
    eligibility: (p.eligibility ?? []).join(", "),
  };
}

const DIET_OPTIONS = ["HALAL", "VEGAN", "VEGETARIAN", "KOSHER", "ANY", "NONE"];

export default function AdminPantryModal({ mode, pantry, onClose, onSaved }) {
  const [form, setForm] = useState(mode === "edit" ? pantryToForm(pantry) : emptyForm());
  const [error, setError] = useState("");
  const [loading, setLoading] = useState(false);

  const set = (field, value) => setForm((f) => ({ ...f, [field]: value }));

  const toggleDiet = (diet) => {
    setForm((f) => ({
      ...f,
      supported_diets: f.supported_diets.includes(diet)
        ? f.supported_diets.filter((d) => d !== diet)
        : [...f.supported_diets, diet],
    }));
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError("");
    setLoading(true);

    const payload = {
      ...form,
      eligibility: form.eligibility
        ? form.eligibility.split(",").map((s) => s.trim()).filter(Boolean)
        : [],
    };

    const result = mode === "edit"
      ? await updatePantry(pantry.id, payload)
      : await addPantry(payload);

    setLoading(false);

    if (!result.ok) {
      setError(result.data?.description || result.data?.error || "Failed to save pantry.");
      return;
    }
    onSaved();
  };

  return createPortal(
    <div style={styles.overlay} onClick={onClose}>
      <div style={styles.modal} onClick={(e) => e.stopPropagation()}>
        <div style={styles.header}>
          <h2 style={styles.title}>{mode === "edit" ? "Edit Pantry" : "Add Pantry"}</h2>
          <button style={styles.closeBtn} onClick={onClose}>✕</button>
        </div>

        <form onSubmit={handleSubmit} style={styles.form}>
          {error && <div className="auth-error">{error}</div>}

          {FIELDS.map(({ name, label, required, type, maxLength, multiline }) => (
            <div className="auth-field" key={name}>
              <label htmlFor={name}>{label}{required && " *"}</label>
              {multiline ? (
                <textarea
                  id={name}
                  rows={3}
                  value={form[name]}
                  onChange={(e) => set(name, e.target.value)}
                  style={{ padding: "0.65rem 0.9rem", border: "1.5px solid #ddd", borderRadius: 8, fontSize: "1rem", resize: "vertical" }}
                />
              ) : (
                <input
                  id={name}
                  type={type || "text"}
                  value={form[name]}
                  onChange={(e) => set(name, e.target.value)}
                  maxLength={maxLength}
                  required={required}
                  step={type === "number" ? "any" : undefined}
                />
              )}
            </div>
          ))}

          {/* Eligibility ZIP codes */}
          <div className="auth-field">
            <label htmlFor="eligibility">Eligible ZIP Codes (comma-separated, or "ANY")</label>
            <input
              id="eligibility"
              type="text"
              value={form.eligibility}
              onChange={(e) => set("eligibility", e.target.value)}
              placeholder="e.g. 22030, 22031 or ANY"
            />
          </div>

          {/* Dietary options */}
          <div className="auth-field">
            <label>Supported Diets</label>
            <div style={{ display: "flex", flexWrap: "wrap", gap: "0.5rem", marginTop: 4 }}>
              {DIET_OPTIONS.map((d) => (
                <label key={d} style={{ display: "flex", alignItems: "center", gap: 5, cursor: "pointer", fontSize: "0.9rem" }}>
                  <input
                    type="checkbox"
                    checked={form.supported_diets.includes(d)}
                    onChange={() => toggleDiet(d)}
                  />
                  {d}
                </label>
              ))}
            </div>
          </div>

          {/* Variable hours */}
          <label style={{ display: "flex", alignItems: "center", gap: 8, cursor: "pointer", fontSize: "0.95rem" }}>
            <input
              type="checkbox"
              checked={form.has_variable_hours}
              onChange={(e) => set("has_variable_hours", e.target.checked)}
            />
            Has variable hours
          </label>

          <div style={{ display: "flex", gap: "0.8rem", marginTop: "0.5rem" }}>
            <button type="button" className="auth-btn auth-btn-secondary" onClick={onClose} style={{ flex: 1 }}>
              Cancel
            </button>
            <button type="submit" className="auth-btn" disabled={loading} style={{ flex: 2 }}>
              {loading ? "Saving…" : mode === "edit" ? "Save Changes" : "Add Pantry"}
            </button>
          </div>
        </form>
      </div>
    </div>,
    document.body
  );
}

const styles = {
  overlay: {
    position: "fixed", inset: 0, background: "rgba(0,0,0,0.5)",
    display: "flex", alignItems: "center", justifyContent: "center", zIndex: 1000,
  },
  modal: {
    background: "white", borderRadius: 14, width: "90%", maxWidth: 560,
    maxHeight: "90vh", overflowY: "auto", boxShadow: "0 8px 40px rgba(0,0,0,0.2)",
  },
  header: {
    display: "flex", justifyContent: "space-between", alignItems: "center",
    padding: "1.2rem 1.5rem", borderBottom: "1px solid #eee", position: "sticky", top: 0, background: "white",
  },
  title: { margin: 0, fontSize: "1.2rem", color: "#1a1a1a" },
  closeBtn: {
    background: "none", border: "none", fontSize: "1.1rem", cursor: "pointer", color: "#888",
    padding: "0.25rem 0.5rem", borderRadius: 6,
  },
  form: { padding: "1.5rem", display: "flex", flexDirection: "column", gap: "1rem" },
};
