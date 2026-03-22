import { useState } from "react";
import "../styles/MapFilters.css";

const MapFilters = ({ onSearch }) => {
  const [searchLocation, setSearchLocation] = useState("");
  const [kosher, setKosher] = useState(false);
  const [halal, setHalal] = useState(false);
  const [residentialZip, setResidentialZip] = useState("");
  const [showOpen, setShowOpen] = useState(false);

  const handleSearch = () => {
    onSearch({ searchLocation, kosher, halal, residentialZip, showOpen });
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
          placeholder="Address, zipcodes..."
          className="filter-search-input"
        />
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
      </div>

      <div className="filter-divider" />

      {/* Residential Zipcode for eligibility */}
      <div className="filter-section">
        <p className="filter-section-label">Your Residential Zipcode</p>
        <input
          type="text"
          value={residentialZip}
          onChange={(e) => setResidentialZip(e.target.value)}
          placeholder="Zipcode..."
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

      {/* Search Button */}
      <button className="filter-button" onClick={handleSearch}>
        Search
      </button>
    </div>
  );
};

export default MapFilters;
