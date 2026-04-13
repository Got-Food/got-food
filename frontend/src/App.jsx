import { BrowserRouter, Routes, Route } from "react-router-dom";
import { library } from "@fortawesome/fontawesome-svg-core";
import { fas } from "@fortawesome/free-solid-svg-icons";
import { far } from "@fortawesome/free-regular-svg-icons";
import { fab } from "@fortawesome/free-brands-svg-icons";
import SearchPage from "./pages/SearchPage";
import ResourcesPage from "./pages/ResourcesPage";
import FormPage from "./pages/FormPage";

library.add(fas, far, fab);

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<SearchPage />} />
        <Route path="/resources" element={<ResourcesPage />} />
        <Route path="/form" element={<FormPage />} />
        
      </Routes>
    </BrowserRouter>
  );
}

export default App;
