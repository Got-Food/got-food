import "../styles/MapMenu.css";

import { MenuItem } from "./MenuItem";

export function MapMenu({ items = [] }) {
  return (
    <div className="map-menu-card">
      <div className="map-menu-header">
        <h2 className="map-menu-title">Nearby Food Pantries</h2>
      </div>

      <div className="map-menu-divider" />

      <div className="map-menu-list">
        {items.map((item) => (
          <MenuItem
            key={item.id}
            title={item.title}
            description={item.description}
          />
        ))}
      </div>
    </div>
  );
}

export default MapMenu;
