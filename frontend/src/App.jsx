import { BrowserRouter, Routes, Route, Navigate, useLocation } from "react-router-dom";
import { library } from "@fortawesome/fontawesome-svg-core";
import { fas } from "@fortawesome/free-solid-svg-icons";
import { far } from "@fortawesome/free-regular-svg-icons";
import { fab } from "@fortawesome/free-brands-svg-icons";

import { AuthProvider, useAuth } from "./context/AuthContext";
import SearchPage from "./pages/SearchPage";
import ResourcesPage from "./pages/ResourcesPage";
import LoginPage from "./pages/LoginPage";
import AccountPage from "./pages/AccountPage";

library.add(fas, far, fab);

function RequireAuth({ children }) {
  const { isAuthenticated } = useAuth();
  const location = useLocation();
  if (!isAuthenticated) {
    return <Navigate to="/login" state={{ from: location.pathname }} replace />;
  }
  return children;
}

function App() {
  return (
    <AuthProvider>
      <BrowserRouter>
        <Routes>
          <Route path="/" element={<SearchPage />} />
          <Route path="/events" element={<ResourcesPage />} />
          <Route path="/login" element={<LoginPage />} />
          <Route
            path="/account"
            element={
              <RequireAuth>
                <AccountPage />
              </RequireAuth>
            }
          />
        </Routes>
      </BrowserRouter>
    </AuthProvider>
  );
}

export default App;
