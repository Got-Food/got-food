import "../styles/MapMenu.css";
import { useEffect, useState, useRef } from "react";
import { MenuItem } from "./MenuItem";

export function MapMenu({ items = [], onSelectPantry, pantrySelection }) {
  const [flashId, setFlashId] = useState(null);
  const flashTimeoutRef = useRef(null);

  useEffect(() => {
    if (pantrySelection == null) return;
    const el = document.getElementById(`pantry-${pantrySelection.id}`);
    if (!el) return;

    const menuList = el.closest(".map-menu-list");

    const triggerFlash = () => {
      clearTimeout(flashTimeoutRef.current);
      setFlashId(null);
      setTimeout(() => {
        setFlashId(pantrySelection.id);
        flashTimeoutRef.current = setTimeout(() => setFlashId(null), 2000);
      }, 50); // 👈 increase from 0 to 50 to ensure null render happens first
    };

    const elRect = el.getBoundingClientRect();
    const listRect = menuList.getBoundingClientRect();
    const scrollOffset = menuList.scrollTop + (elRect.top - listRect.top);
    const needsScroll = Math.abs(elRect.top - listRect.top) > 5;

    if (needsScroll) {
      const scrollBefore = menuList.scrollTop;
      menuList.scrollTo({ top: scrollOffset, behavior: "smooth" });

      let scrollTimeout;
      const onScroll = () => {
        clearTimeout(scrollTimeout);
        scrollTimeout = setTimeout(() => {
          menuList.removeEventListener("scroll", onScroll);
          triggerFlash();
        }, 100);
      };
      menuList.addEventListener("scroll", onScroll);
      setTimeout(() => {
        if (menuList.scrollTop === scrollBefore) {
          menuList.removeEventListener("scroll", onScroll);
          clearTimeout(scrollTimeout);
          triggerFlash();
        }
      }, 50);

      return () => {
        menuList.removeEventListener("scroll", onScroll);
        clearTimeout(scrollTimeout);
        clearTimeout(flashTimeoutRef.current);
        setFlashId(null);
      };
    } else {
      triggerFlash();
      return () => {
        clearTimeout(flashTimeoutRef.current);
        setFlashId(null);
      };
    }
  }, [pantrySelection]);

  return (
    <div className="map-menu-card">
      <div className="map-menu-header">
        <h2 className="map-menu-title">Nearby Food Pantries</h2>
      </div>

      <div className="map-menu-divider" />

      <div className="map-menu-list">
        {items.map((item) => (
          <div key={item.id} onClick={() => onSelectPantry?.(item)}>
            <MenuItem details={item} flash={item.id === flashId} />
          </div>
        ))}
      </div>
    </div>
  );
}

export default MapMenu;
