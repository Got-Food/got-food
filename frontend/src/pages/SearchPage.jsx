import { useState, useEffect } from "react";
import Navbar from "../components/Navbar";
import Header from "../components/Header";
import Map from "../components/Map";
import Filter from "../components/MapFilters";
import Menu from "../components/MapMenu";
import { getAllPantries, getPantries } from "../utils/api_requests";
import { STATE_NAMES } from "../utils/state_names";

function SearchPage() {
  const [pantries, setPantries] = useState([]);
  const [selectedPantry, setSelectedPantry] = useState(null);
  const [pantrySelection, setPantrySelection] = useState(null);

  useEffect(() => {
    getAllPantries().then((data) => {
      console.log("Raw API response:", data);
      if (!data) return;
      setPantries(data);
    });
  }, []);

  const handleSearch = ({
    searchLocation,
    kosher,
    halal,
    showOpen,
    noShowVaried,
    residentialZip,
  }) => {
    const diets = [];
    if (kosher) diets.push("KOSHER");
    if (halal) diets.push("HALAL");

    getPantries(
      showOpen,
      residentialZip || undefined,
      diets.length > 0 ? diets : undefined,
      true,
    ).then((data) => {
      if (!data) return;

      let filtered = data;

      if (noShowVaried) {
        filtered = filtered.filter((p) => !p.has_variable_hours);
      }

      if (searchLocation) {
        const tokens = searchLocation
          .toLowerCase()
          .split(/\s+/)
          .filter((t) => /[a-z0-9]/.test(t));
        filtered = filtered.filter((p) => {
          const stateName = STATE_NAMES[p.state] ?? "";
          const fields = [p.name, p.address, p.city, p.zip, p.state, stateName]
            .filter(Boolean)
            .join(" ")
            .toLowerCase();
          return tokens.every((token) => fields.includes(token));
        });
      }
      setPantries(filtered);
    });
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
        />
        <Map
          pantries={pantries}
          selectedPantry={selectedPantry}
          onSelectPantry={(id) =>
            setPantrySelection((prev) => ({
              id,
              count: (prev?.count ?? 0) + 1,
            }))
          }
        />
        <Filter onSearch={handleSearch} />
      </main>
    </div>
  );
}

export default SearchPage;
