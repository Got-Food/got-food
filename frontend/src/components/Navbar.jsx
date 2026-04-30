import { NavLink, useNavigate } from "react-router-dom";
import { useAuth } from "../context/AuthContext";
import "../styles/Navbar.css";

function Navbar() {
  const { isAuthenticated, isAdmin, user, logout } = useAuth();
  const navigate = useNavigate();

  const handleLogout = () => {
    logout();
    navigate("/");
  };

  return (
    <nav className="navbar">
      <ul className="nav-links">
        <li>
          <NavLink to="/" end>Search</NavLink>
        </li>
        <li>
          <NavLink to="/events">Events</NavLink>
        </li>
      </ul>

      <div className="nav-auth">
        {isAuthenticated ? (
          <>
            {isAdmin && <span className="nav-admin-badge">Admin</span>}
            <NavLink to="/account" className="nav-user-link">
              {user?.email}
            </NavLink>
            <button className="nav-logout-btn" onClick={handleLogout}>
              Sign Out
            </button>
          </>
        ) : (
          <NavLink to="/login" className="nav-auth-link nav-auth-link-primary">Sign In</NavLink>
        )}
      </div>
    </nav>
  );
}

export default Navbar;
