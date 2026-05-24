# Deuss Studio — Massage CRM

A gold-and-black CRM for managing clients, packages, bookings, revenue, and history.

This version stores data in your browser (localStorage). It works fully and persists
per-browser, but data is NOT shared between devices. See "Going further" below for Supabase.

---

## Run it locally

```bash
npm install
npm run dev
```

Open the localhost link it prints (usually http://localhost:5173).

---

## Deploy to Vercel (step by step)

### 1. Put these files in your GitHub repo
Your repo currently has only the .jsx file. Replace its contents with EVERYTHING in
this folder (package.json, vite.config.js, index.html, the src/ folder, etc).

If you use the GitHub website:
- Delete the old `deuss-massage-crm (1).jsx` file in the repo.
- Upload all the files/folders from this project (use "Add file > Upload files",
  and drag the whole folder in).

If you use the command line:
```bash
git clone https://github.com/Nazimi1/deuss.git
cd deuss
# copy all files from this project into the deuss folder, replacing the old .jsx
git add .
git commit -m "Add full Vite project"
git push
```

### 2. Deploy on Vercel
1. Go to https://vercel.com and sign in with GitHub.
2. Click **Add New → Project**.
3. Import the **Nazimi1/deuss** repo.
4. Vercel auto-detects "Vite". Leave all settings as default:
   - Framework Preset: Vite
   - Build Command: `npm run build`
   - Output Directory: `dist`
5. Click **Deploy**.

After ~1 minute you'll get a live URL like `https://deuss.vercel.app`.
Every time you push to GitHub, Vercel redeploys automatically.

---

## Going further: shared, permanent storage (Supabase)

The current version stores data only in each browser. To share data across your phone
and the studio computer — and to keep it safe — you'd connect Supabase (a free database)
and add a login for your team. That's a separate change to the storage layer in
`src/App.jsx` (the `loadKey` / `saveKey` helpers and the operations that call them).

Ask Claude to "convert this to the Supabase version with login" when you're ready.
