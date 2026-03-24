import "../styles/MapMenu.css";

import { MenuItem } from "./MenuItem";

export function MapMenu({ items = [], onSelectPantry }) {
  return (
    <div className="map-menu-card">
      <div className="map-menu-header">
        <h2 className="map-menu-title">Nearby Food Pantries</h2>
      </div>

      <div className="map-menu-divider" />

      <div className="map-menu-list">
        {items.map((item) => (
          <div
            key={item.id}
            onClick={() => {
              onSelectPantry?.(item);
            }}
          >
            <MenuItem details={item} />
          </div>
        ))}
      </div>
    </div>
  );
}

export default MapMenu;
