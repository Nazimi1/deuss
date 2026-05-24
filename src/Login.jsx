import React, { useState } from "react";
import { Lock, Mail } from "lucide-react";

const GOLD = "#c9a227";
const GOLD_LIGHT = "#e6c45a";

const VALID_EMAIL = "admin@deuss.com";
const VALID_PASSWORD = "DeussStudio1234!";

export default function Login({ onLogin }) {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  const [loading, setLoading] = useState(false);

  const submit = (e) => {
    e.preventDefault();
    setError("");
    setLoading(true);
    setTimeout(() => {
      if (email.trim().toLowerCase() === VALID_EMAIL && password === VALID_PASSWORD) {
        sessionStorage.setItem("deuss_auth", "1");
        onLogin();
      } else {
        setError("Invalid email or password");
        setLoading(false);
      }
    }, 250);
  };

  return (
    <div style={S.wrap}>
      <style>{CSS}</style>
      <div style={S.card} className="login-card">
        <div style={S.brand}>
          <div style={S.brandName}>Deuss Studio</div>
          <div style={S.brandSub}>MASSAGE CRM</div>
        </div>

        <div style={S.divider} />

        <h1 style={S.title}>Sign in</h1>
        <p style={S.subtitle}>Welcome back. Please enter your credentials.</p>

        <form onSubmit={submit} style={{ marginTop: 22, display: "flex", flexDirection: "column", gap: 14 }}>
          <label style={S.label}>
            <span style={S.labelText}>Email</span>
            <div style={S.inputWrap}>
              <Mail size={16} color="#8a8a83" strokeWidth={1.8} />
              <input
                type="email"
                autoComplete="email"
                placeholder="admin@deuss.com"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                style={S.input}
                required
              />
            </div>
          </label>

          <label style={S.label}>
            <span style={S.labelText}>Password</span>
            <div style={S.inputWrap}>
              <Lock size={16} color="#8a8a83" strokeWidth={1.8} />
              <input
                type="password"
                autoComplete="current-password"
                placeholder="••••••••"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                style={S.input}
                required
              />
            </div>
          </label>

          {error && <div style={S.error}>{error}</div>}

          <button type="submit" disabled={loading} style={S.button} className="login-btn">
            {loading ? "Signing in…" : "Sign in"}
          </button>
        </form>

        <div style={S.foot}>Authorized personnel only</div>
      </div>
    </div>
  );
}

const S = {
  wrap: {
    minHeight: "100vh",
    width: "100%",
    background: "radial-gradient(1200px 600px at 50% -10%, rgba(201,162,39,0.12), transparent 60%), #0b0b0b",
    display: "flex",
    alignItems: "center",
    justifyContent: "center",
    padding: 24,
    fontFamily: "Inter, system-ui, -apple-system, Segoe UI, Roboto, sans-serif",
  },
  card: {
    width: "100%",
    maxWidth: 420,
    background: "#141413",
    border: "1px solid #2a2a26",
    borderRadius: 16,
    padding: 32,
    boxShadow: "0 30px 60px rgba(0,0,0,0.5)",
  },
  brand: { textAlign: "center" },
  brandName: {
    fontFamily: "Georgia, 'Times New Roman', serif",
    fontSize: 26,
    color: GOLD_LIGHT,
    letterSpacing: 0.5,
  },
  brandSub: {
    fontSize: 11,
    letterSpacing: 4,
    color: "#8a8a83",
    marginTop: 4,
  },
  divider: { height: 1, background: "#2a2a26", margin: "20px 0 4px" },
  title: { color: "#f1ead6", fontSize: 22, margin: "16px 0 4px", fontWeight: 600 },
  subtitle: { color: "#8a8a83", fontSize: 13.5, margin: 0 },
  label: { display: "flex", flexDirection: "column", gap: 6 },
  labelText: { fontSize: 11.5, letterSpacing: 1.2, color: "#9b9b95", textTransform: "uppercase" },
  inputWrap: {
    display: "flex",
    alignItems: "center",
    gap: 10,
    background: "#0f0f0e",
    border: "1px solid #2a2a26",
    borderRadius: 10,
    padding: "11px 12px",
    transition: "border-color 0.15s",
  },
  input: {
    flex: 1,
    background: "transparent",
    border: "none",
    outline: "none",
    color: "#f1ead6",
    fontSize: 14.5,
    fontFamily: "inherit",
  },
  error: {
    background: "rgba(220,38,38,0.1)",
    border: "1px solid rgba(220,38,38,0.3)",
    color: "#fca5a5",
    fontSize: 13,
    padding: "10px 12px",
    borderRadius: 8,
  },
  button: {
    marginTop: 6,
    background: `linear-gradient(180deg, ${GOLD_LIGHT}, ${GOLD})`,
    color: "#1a1a17",
    border: "none",
    padding: "12px 16px",
    borderRadius: 10,
    fontSize: 14.5,
    fontWeight: 700,
    letterSpacing: 0.3,
    cursor: "pointer",
    fontFamily: "inherit",
  },
  foot: {
    textAlign: "center",
    marginTop: 22,
    fontSize: 11,
    letterSpacing: 2,
    color: "#6f6f68",
    textTransform: "uppercase",
  },
};

const CSS = `
  .login-card input:focus { outline: none; }
  .login-card div:has(input:focus) { border-color: ${GOLD} !important; }
  .login-btn:hover { filter: brightness(1.05); }
  .login-btn:disabled { opacity: 0.7; cursor: not-allowed; }
`;
