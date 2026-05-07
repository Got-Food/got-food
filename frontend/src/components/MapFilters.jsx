import { useState } from "react";
import "../styles/MapFilters.css";

const MapFilters = ({ onSearch }) => {
  const [searchLocation, setSearchLocation] = useState("");
  const [kosher, setKosher] = useState(false);
  const [halal, setHalal] = useState(false);
  const [vegan, setVegan] = useState(false);
  const [vegetarian, setVegetarian] = useState(false);
  const [residentialZip, setResidentialZip] = useState("");
  const [showOpen, setShowOpen] = useState(false);
  const [noShowVaried, setNoShowVaried] = useState(false);
  const [useRadius, setUseRadius] = useState(false);
  const [radiusMiles, setRadiusMiles] = useState(10);

  const handleSearch = () => {
    onSearch({
      searchLocation,
      kosher,
      halal,
      vegan,
      vegetarian,
      residentialZip,
      showOpen,
      noShowVaried,
      radiusMiles: useRadius ? radiusMiles : null,
    });
  };

  return (
    <div className="filter-container">
      <p className="filter-section-label">Search for Nearby Food Pantries</p>

      {/* Search Bar */}
      <div className="filter-search-wrapper">
        <input
          type="text"
          value={searchLocation}
          onChange={(e) => setSearchLocation(e.target.value)}
          onKeyDown={(e) => {
            if (e.key === "Enter") {
              e.target.blur();
            }
          }}
          placeholder="Enter your current location"
          className="filter-search-input"
        />
      </div>

      <div className="filter-section">
        <label className="filter-checkbox-label">
          <input
            type="checkbox"
            checked={useRadius}
            onChange={(e) => setUseRadius(e.target.checked)}
            className="filter-checkbox-input"
            disabled={!searchLocation.trim()}
          />
          <span
            className={`filter-custom-checkbox${useRadius ? " checked" : ""}`}
          >
            {useRadius && (
              <svg width="11" height="11" viewBox="0 0 12 12" fill="none">
                <path
                  d="M2 6l3 3 5-5"
                  stroke="white"
                  strokeWidth="2"
                  strokeLinecap="round"
                  strokeLinejoin="round"
                />
              </svg>
            )}
          </span>
          <span className="filter-checkbox-text">
            Display only those within {radiusMiles} mile
            {radiusMiles !== 1 ? "s" : ""}
          </span>
        </label>

        <input
          type="range"
          min="1"
          max="100"
          step="1"
          value={radiusMiles}
          onChange={(e) => setRadiusMiles(Number(e.target.value))}
          className="filter-range-input"
          disabled={!useRadius || !searchLocation.trim()}
        />
        <div
          style={{
            display: "flex",
            justifyContent: "space-between",
            fontSize: "0.75rem",
            color: "#999",
            opacity: useRadius ? 1 : 0.4,
          }}
        >
          <span>1 mi</span>
          <span>100 mi</span>
        </div>
      </div>

      <div className="filter-section">
        <label className="filter-checkbox-label">
          <input
            type="checkbox"
            checked={useRadius}
            onChange={(e) => setUseRadius(e.target.checked)}
            className="filter-checkbox-input"
            disabled={!searchLocation.trim()}
          />
          <span
            className={`filter-custom-checkbox${useRadius ? " checked" : ""}`}
          >
            {useRadius && (
              <svg width="11" height="11" viewBox="0 0 12 12" fill="none">
                <path
                  d="M2 6l3 3 5-5"
                  stroke="white"
                  strokeWidth="2"
                  strokeLinecap="round"
                  strokeLinejoin="round"
                />
              </svg>
            )}
          </span>
          <span className="filter-checkbox-text">
            Display only those within {radiusMiles} mile
            {radiusMiles !== 1 ? "s" : ""}
          </span>
        </label>

        <input
          type="range"
          min="1"
          max="100"
          step="1"
          value={radiusMiles}
          onChange={(e) => setRadiusMiles(Number(e.target.value))}
          className="filter-range-input"
          disabled={!useRadius || !searchLocation.trim()}
        />
        <div
          style={{
            display: "flex",
            justifyContent: "space-between",
            fontSize: "0.75rem",
            color: "#999",
            opacity: useRadius ? 1 : 0.4,
          }}
        >
          <span>1 mi</span>
          <span>100 mi</span>
        </div>
      </div>

      <div className="filter-divider" />

      {/* Dietary Restrictions */}
      <div className="filter-section">
        <p className="filter-section-label">Dietary Restrictions</p>

        <label className="filter-checkbox-label">
          <input
            type="checkbox"
            checked={kosher}
            onChange={(e) => setKosher(e.target.checked)}
            className="filter-checkbox-input"
          />
          <span className={`filter-custom-checkbox${kosher ? " checked" : ""}`}>
            {kosher && (
              <svg width="11" height="11" viewBox="0 0 12 12" fill="none">
                <path
                  d="M2 6l3 3 5-5"
                  stroke="white"
                  strokeWidth="2"
                  strokeLinecap="round"
                  strokeLinejoin="round"
                />
              </svg>
            )}
          </span>
          <span className="filter-checkbox-text">Kosher</span>
        </label>

        <label className="filter-checkbox-label">
          <input
            type="checkbox"
            checked={halal}
            onChange={(e) => setHalal(e.target.checked)}
            className="filter-checkbox-input"
          />
          <span className={`filter-custom-checkbox${halal ? " checked" : ""}`}>
            {halal && (
              <svg width="11" height="11" viewBox="0 0 12 12" fill="none">
                <path
                  d="M2 6l3 3 5-5"
                  stroke="white"
                  strokeWidth="2"
                  strokeLinecap="round"
                  strokeLinejoin="round"
                />
              </svg>
            )}
          </span>
          <span className="filter-checkbox-text">Halal</span>
        </label>

        <label className="filter-checkbox-label">
          <input
            type="checkbox"
            checked={vegan}
            onChange={(e) => setVegan(e.target.checked)}
            className="filter-checkbox-input"
          />
          <span className={`filter-custom-checkbox${vegan ? " checked" : ""}`}>
            {vegan && (
              <svg width="11" height="11" viewBox="0 0 12 12" fill="none">
                <path
                  d="M2 6l3 3 5-5"
                  stroke="white"
                  strokeWidth="2"
                  strokeLinecap="round"
                  strokeLinejoin="round"
                />
              </svg>
            )}
          </span>
          <span className="filter-checkbox-text">Vegan</span>
        </label>

        <label className="filter-checkbox-label">
          <input
            type="checkbox"
            checked={vegetarian}
            onChange={(e) => setVegetarian(e.target.checked)}
            className="filter-checkbox-input"
          />
          <span
            className={`filter-custom-checkbox${vegetarian ? " checked" : ""}`}
          >
            {vegetarian && (
              <svg width="11" height="11" viewBox="0 0 12 12" fill="none">
                <path
                  d="M2 6l3 3 5-5"
                  stroke="white"
                  strokeWidth="2"
                  strokeLinecap="round"
                  strokeLinejoin="round"
                />
              </svg>
            )}
          </span>
          <span className="filter-checkbox-text">Vegetarian</span>
        </label>
      </div>

      <div className="filter-divider" />

      {/* Residential Zipcode for eligibility */}
      <div className="filter-section">
        <p className="filter-section-label">Your Residential Zipcode</p>
        <input
          type="text"
          value={residentialZip}
          onChange={(e) => {
            // Remove any non-digit characters and limit length to 5
            const onlyNumbers = e.target.value.replace(/\D/g, "").slice(0, 5);
            setResidentialZip(onlyNumbers);
          }}
          placeholder="Some pantries are restricted to specific zipcodes"
          className="filter-text-input"
        />
      </div>

      <div className="filter-divider" />

      <div className="filter-section">
        <label className="filter-checkbox-label">
          <input
            type="checkbox"
            checked={showOpen}
            onChange={(e) => setShowOpen(e.target.checked)}
            className="filter-checkbox-input"
          />
          <span
            className={`filter-custom-checkbox${showOpen ? " checked" : ""}`}
          >
            {showOpen && (
              <svg width="11" height="11" viewBox="0 0 12 12" fill="none">
                <path
                  d="M2 6l3 3 5-5"
                  stroke="white"
                  strokeWidth="2"
                  strokeLinecap="round"
                  strokeLinejoin="round"
                />
              </svg>
            )}
          </span>
          <span className="filter-checkbox-text">Only Show Currently Open</span>
        </label>
      </div>
      <div className="filter-section">
        <label className="filter-checkbox-label">
          <input
            type="checkbox"
            checked={noShowVaried}
            onChange={(e) => setNoShowVaried(e.target.checked)}
            className="filter-checkbox-input"
          />
          <span
            className={`filter-custom-checkbox${noShowVaried ? " checked" : ""}`}
          >
            {noShowVaried && (
              <svg width="11" height="11" viewBox="0 0 12 12" fill="none">
                <path
                  d="M2 6l3 3 5-5"
                  stroke="white"
                  strokeWidth="2"
                  strokeLinecap="round"
                  strokeLinejoin="round"
                />
              </svg>
            )}
          </span>
          <span className="filter-checkbox-text">
            Exclude Pantries With Varied Hours
          </span>
        </label>
      </div>

      {/* Search Button */}
      <button className="filter-button" onClick={handleSearch}>
        Search
      </button>
    </div>
  );
};

export default MapFilters;
