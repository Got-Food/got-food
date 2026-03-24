import { useState, useEffect } from "react";
import Navbar from "../components/Navbar";
import Header from "../components/Header";
import Map from "../components/Map";
import Filter from "../components/MapFilters";
import Menu from "../components/MapMenu";
import { getAllPantries } from "../utils/api_requests";

function SearchPage() {
  const [pantries, setPantries] = useState([]);
  const [selectedPantry, setSelectedPantry] = useState(null);

  useEffect(() => {
    getAllPantries().then((data) => {
      console.log("Raw API response:", data);
      if (!data) return;
      const items = data.map((pantry) => pantry);
      setPantries(items);
    });
  }, []);
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
          onSelectPantry={(pantry) => setSelectedPantry(pantry)}
        />
        <Map selectedPantry={selectedPantry} />
        <Filter />
      </main>
    </div>
  );
}

export default SearchPage;
