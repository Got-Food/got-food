import { useState, useEffect } from "react";
import Navbar from "../components/Navbar";
import Header from "../components/Header";
import Map from "../components/Map";
import Filter from "../components/MapFilters";
import Menu from "../components/MapMenu";
import { getAllPantries, getPantries, getCoords } from "../utils/api_requests";

function SearchPage() {
  const [allPantries, setAllPantries] = useState([]);
  const [pantries, setPantries] = useState([]);
  const [selectedPantry, setSelectedPantry] = useState(null);
  const [pantrySelection, setPantrySelection] = useState(null);
  const [coords, setCoords] = useState(null);

  useEffect(() => {
    getAllPantries().then((data) => {
      console.log("Raw API response:", data);
      if (!data) return;
      setAllPantries(data);
      setPantries(data);
    });
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
    </div>
  );
}

export default SearchPage;
