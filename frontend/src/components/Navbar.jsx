import { NavLink } from "react-router-dom";
import "../styles/Navbar.css";

function Navbar() {
  return (
    <nav className="navbar">
      <ul className="nav-links">
        <li>
          <NavLink to="/" end>
            Search
          </NavLink>
        </li>
        <li>
          <NavLink to="/resources">Other Resources</NavLink>
        </li>
        <li>
          <NavLink to="/form">Add a Pantry</NavLink>
        </li>
      </ul>
    </nav>
  );
}

export default Navbar;
