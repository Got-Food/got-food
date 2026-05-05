import { useEffect } from "react";
import { useNavigate } from "react-router-dom";
import { useAuth } from "../context/AuthContext";
import Header from "../components/Header";
import Navbar from "../components/Navbar";
import "../styles/Auth.css";

export default function AccountPage() {
  const { user, logout } = useAuth();
  const navigate = useNavigate();

  useEffect(() => {
    if (!user) navigate("/login");
  }, [user, navigate]);

  if (!user) return null;

  return (
    <div style={{ minHeight: "100vh", background: "#f5f5f5" }}>
      <Header />
      <Navbar />
      <div style={{ maxWidth: 480, margin: "2rem auto", padding: "0 1rem" }}>
        <div className="account-section">
          <h3>Account Info</h3>
          <div className="account-meta">
            <div className="account-meta-row">
              <span className="account-meta-label">Email</span>
              <span className="account-meta-value">{user.email}</span>
            </div>
            <div className="account-meta-row">
              <span className="account-meta-label">Role</span>
              <span className="role-badge role-badge-admin">{user.role}</span>
            </div>
          </div>
        </div>

        <div style={{ marginTop: "1.5rem" }}>
          <button className="auth-btn" onClick={() => { logout(); navigate("/"); }}>
            Sign Out
          </button>
        </div>
      </div>
    </div>
  );
}
