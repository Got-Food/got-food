import { useState } from "react";
import { useNavigate, useLocation } from "react-router-dom";
import { FaEye, FaEyeSlash } from "react-icons/fa";
import { useAuth } from "../context/AuthContext";
import { apiLogin, apiGetMe } from "../utils/auth_requests";
import Header from "../components/Header";
import "../styles/Auth.css";

export default function LoginPage() {
  const { login } = useAuth();
  const navigate = useNavigate();
  const location = useLocation();
  const from = location.state?.from || "/";

  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [showPw, setShowPw] = useState(false);
  const [error, setError] = useState("");
  const [loading, setLoading] = useState(false);

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError("");
    setLoading(true);

    const { ok, status, data } = await apiLogin(email.trim().toLowerCase(), password);

    if (!ok) {
      setLoading(false);
      setError(data.error || "Invalid email or password.");
      return;
    }

    // Fetch full user profile to store in context
    const { ok: meOk, data: meData } = await apiGetMe(data.access_token);
    if (!meOk) {
      setError("Login succeeded but failed to load profile. Please try again.");
      setLoading(false);
      return;
    }

    login(data.access_token, meData);
    navigate(from, { replace: true });
  };

  return (
    <div className="auth-page">
      <Header />
      <div className="auth-card">
        <h2>Sign In</h2>
        <p className="auth-subtitle">Welcome back to Got Food</p>

        <form className="auth-form" onSubmit={handleSubmit} noValidate>
          {error && <div className="auth-error">{error}</div>}

          <div className="auth-field">
            <label htmlFor="email">Email</label>
            <input
              id="email"
              type="email"
              autoComplete="email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              required
            />
          </div>

          <div className="auth-field">
            <label htmlFor="password">Password</label>
            <div className="password-wrapper">
              <input
                id="password"
                type={showPw ? "text" : "password"}
                autoComplete="current-password"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                required
              />
              <button
                type="button"
                className="password-toggle"
                onClick={() => setShowPw((p) => !p)}
                aria-label={showPw ? "Hide password" : "Show password"}
              >
                {showPw ? <FaEyeSlash /> : <FaEye />}
              </button>
            </div>
          </div>

          <button className="auth-btn" type="submit" disabled={loading}>
            {loading ? "Signing in…" : "Sign In"}
          </button>
        </form>

      </div>
    </div>
  );
}
