import Navbar from "../components/Navbar";
import Header from "../components/Header";

function Form() {
  return (
    <div
      style={{
        display: "flex",
        flexDirection: "column",
        minHeight: "100vh",
        backgroundColor: "white",
      }}
    >
      <Header />
      <Navbar />
      <main>
        <h1 style={{ color: "black", textAlign: "center"}}> Add a Pantry </h1>
      </main>
    </div>
  );
}
export default Form;