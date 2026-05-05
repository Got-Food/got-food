import { useNavigate } from "react-router-dom";
import "../styles/Header.css";
import logo1 from "../assets/vt_icon.png";
import logo2 from "../assets/hokie_bird.png";

function Header() {
  const navigate = useNavigate();

  return (
    <header className="header" onClick={() => navigate("/")} style={{ cursor: "pointer" }}>
      <div className="header-container">
        <div className="header-left">
          <img src={logo1} alt="Logo" className="header-logo" />
        </div>

        <h1 className="header-title">
          Hokie Food Resources in Northern Virginia
        </h1>

        <div className="header-right">
          <img src={logo2} alt="Logo" className="header-logo" />
        </div>
      </div>
    </header>
  );
}

export default Header;
