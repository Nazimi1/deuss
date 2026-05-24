import React, { useState } from "react";
import ReactDOM from "react-dom/client";
import App from "./App.jsx";
import Login from "./Login.jsx";

function Root() {
  const [authed, setAuthed] = useState(() => sessionStorage.getItem("deuss_auth") === "1");
  if (!authed) return <Login onLogin={() => setAuthed(true)} />;
  return <App onLogout={() => { sessionStorage.removeItem("deuss_auth"); setAuthed(false); }} />;
}

ReactDOM.createRoot(document.getElementById("root")).render(
  <React.StrictMode>
    <Root />
  </React.StrictMode>
);
