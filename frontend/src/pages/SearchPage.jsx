import { useState, useEffect } from "react";
import Navbar from "../components/Navbar";
import Header from "../components/Header";
import Map from "../components/Map";
import Filter from "../components/MapFilters";
import Menu from "../components/MapMenu";
import AdminPantryModal from "../components/AdminPantryModal";
import {
  getAllPantries,
  getPantries,
  deletePantry,
  getCoords,
} from "../utils/api_requests";
import { useAuth } from "../context/AuthContext";

function SearchPage() {
  const { isAdmin } = useAuth();
  const [allPantries, setAllPantries] = useState([]);
  const [pantries, setPantries] = useState([]);
  const [selectedPantry, setSelectedPantry] = useState(null);
  const [pantrySelection, setPantrySelection] = useState(null);
  const [adminModal, setAdminModal] = useState(null); // null | { mode: "add" } | { mode: "edit", pantry }
  const [coords, setCoords] = useState(null);

  const fetchAll = () => {
    getAllPantries().then((data) => {
      if (!data) return;
      setAllPantries(data);
      setPantries(data);
    });
  };

  useEffect(() => {
    fetchAll();
  }, []);

  const handleSearch = async ({
    searchLocation,
    kosher,
    halal,
    vegan,
    vegetarian,
    showOpen,
    noShowVaried,
    residentialZip,
  }) => {
    const diets = [];
    if (kosher) diets.push("KOSHER");
    if (halal) diets.push("HALAL");
    if (vegan) diets.push("VEGAN");
    if (vegetarian) diets.push("VEGETARIAN");

    const sharedArgs = [
      residentialZip || undefined,
      diets.length > 0 ? diets : undefined,
      true, // showUnknown
    ];

    let filtered;

    if (showOpen && !noShowVaried) {
      // Open pantries + varied hours pantries merged
      const [openData, variedData] = await Promise.all([
        getPantries(true, ...sharedArgs, false),
        getPantries(false, ...sharedArgs, true),
      ]);
      if (!openData || !variedData) return;
      const seen = new Set();
      filtered = [...openData, ...variedData].filter((p) => {
        if (seen.has(p.id)) return false;
        seen.add(p.id);
        return true;
      });
    } else if (showOpen && noShowVaried) {
      // Open pantries only, no varied
      const data = await getPantries(true, ...sharedArgs, false);
      if (!data) return;
      filtered = data;
    } else {
      // All pantries, optionally strip varied
      const data = await getPantries(false, ...sharedArgs, false);
      if (!data) return;
      filtered = noShowVaried
        ? data.filter((p) => !p.has_variable_hours)
        : data;
    }

    if (searchLocation) {
      const result = await getCoords(searchLocation);
      setCoords(result?.lat && result?.lon ? result : null);
    } else {
      setCoords(null);
    }

    setPantries(filtered);
  };

  const handleDeletePantry = async (pantryId) => {
    if (!window.confirm("Delete this pantry? This cannot be undone.")) return;
    const ok = await deletePantry(pantryId);
    if (ok) fetchAll();
  };

  return (
    <div
      style={{
        display: "flex",
        flexDirection: "column",
        minHeight: "100vh",
        backgroundColor: "white",
      }}
    >
      <Header />
      <Navbar />

      {isAdmin && (
        <div
          style={{
            background: "#fce4ec",
            borderBottom: "1px solid #f8bbd0",
            padding: "0.6rem 2rem",
            display: "flex",
            alignItems: "center",
            gap: "1rem",
          }}
        >
          <span
            style={{ fontSize: "0.875rem", color: "#861F41", fontWeight: 600 }}
          >
            Admin Mode
          </span>
          <button
            onClick={() => setAdminModal({ mode: "add" })}
            style={{
              background: "#861F41",
              color: "white",
              border: "none",
              borderRadius: 8,
              padding: "0.4rem 1rem",
              fontSize: "0.875rem",
              fontWeight: 600,
              cursor: "pointer",
            }}
          >
            + Add Pantry
          </button>
        </div>
      )}

      <main
        style={{
          flex: 1,
          display: "grid",
          gridTemplateColumns: "1fr 1fr 1fr",
          gap: "1.5rem",
          padding: "5rem",
          alignItems: "start",
        }}
      >
        <Menu
          items={pantries}
          onSelectPantry={setSelectedPantry}
          pantrySelection={pantrySelection}
          isAdmin={isAdmin}
          onEditPantry={(pantry) => setAdminModal({ mode: "edit", pantry })}
          onDeletePantry={handleDeletePantry}
        />
        <Map
          pantries={pantries}
          selectedPantry={selectedPantry}
          searchCoords={coords}
          onSelectPantry={(id) =>
            setPantrySelection((prev) => ({
              id,
              count: (prev?.count ?? 0) + 1,
            }))
          }
        />
        <Filter onSearch={handleSearch} pantries={allPantries} />
      </main>

      {adminModal && (
        <AdminPantryModal
          mode={adminModal.mode}
          pantry={adminModal.pantry}
          onClose={() => setAdminModal(null)}
          onSaved={() => {
            setAdminModal(null);
            fetchAll();
          }}
        />
      )}
    </div>
  );
}

export default SearchPage;
