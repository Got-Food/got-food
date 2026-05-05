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
import { getCurrentDay } from "../utils/get_current_day";
import { getOpenStatus } from "../utils/get_open_status";
import { getDistanceMiles } from "../utils/get_distance";

function SearchPage() {
  const { isAdmin } = useAuth();
  const [pantries, setPantries] = useState([]);
  const [selectedPantry, setSelectedPantry] = useState(null);
  const [pantrySelection, setPantrySelection] = useState(null);
  const [adminModal, setAdminModal] = useState(null); // null | { mode: "add" } | { mode: "edit", pantry }
  const [coords, setCoords] = useState(null);

  const fetchAll = () => {
    getAllPantries().then((data) => {
      if (!data) return;
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
    radiusMiles,
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
      const data = await getPantries(true, ...sharedArgs, false);
      if (!data) return;
      filtered = data;
    } else {
      const data = await getPantries(false, ...sharedArgs, false);
      if (!data) return;
      filtered = data;
    }

    if (showOpen) {
      const today = getCurrentDay();
      filtered = filtered.filter((p) => {
        const status = getOpenStatus(p, today);
        return status === "open" || status === "varied";
      });
    }

    // Removes all variable hour pantries here if checked
    if (noShowVaried) {
      filtered = filtered.filter((p) => !p.has_variable_hours);
    }

    if (searchLocation) {
      const result = await getCoords(searchLocation);
      setCoords(result?.lat && result?.lon ? result : null);

      if (result?.lat && result?.lon) {
        // check if distance filter is on
        if (radiusMiles) {
          const maxMiles = parseFloat(radiusMiles);
          filtered = filtered.filter((p) => {
            const lat = parseFloat(p.latitude);
            const lon = parseFloat(p.longitude);
            if (isNaN(lat) || isNaN(lon)) return false;
            return (
              getDistanceMiles(result.lat, result.lon, lat, lon) <= maxMiles
            );
          });
        }

        // Sort by distance
        filtered = filtered.sort((a, b) => {
          const distA = getDistanceMiles(
            result.lat,
            result.lon,
            parseFloat(a.latitude),
            parseFloat(a.longitude),
          );
          const distB = getDistanceMiles(
            result.lat,
            result.lon,
            parseFloat(b.latitude),
            parseFloat(b.longitude),
          );
          if (isNaN(distA)) return 1;
          if (isNaN(distB)) return -1;
          return distA - distB;
        });
      }
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
          width: "100%",
          boxSizing: "border-box",
        }}
      >
        <Menu
          items={pantries}
          onSelectPantry={setSelectedPantry}
          pantrySelection={pantrySelection}
          isAdmin={isAdmin}
          onEditPantry={(pantry) => setAdminModal({ mode: "edit", pantry })}
          onDeletePantry={handleDeletePantry}
          searchCoords={coords}
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
        <Filter onSearch={handleSearch} />
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
