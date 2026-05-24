import { createClient } from "@supabase/supabase-js";

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL;
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY;

// Build a safe stub when env vars are missing so the app doesn't crash at import time.
// Every chained call resolves to a Supabase-shaped response: { data: [], error: null }.
function createStubClient() {
  const ok = Promise.resolve({ data: [], error: null });
  const chain = new Proxy(function () {}, {
    get(_t, prop) {
      if (prop === "then") return ok.then.bind(ok);
      if (prop === "catch") return ok.catch.bind(ok);
      if (prop === "finally") return ok.finally.bind(ok);
      return () => chain;
    },
    apply() {
      return chain;
    },
  });
  return {
    from: () => chain,
    auth: {
      getUser: async () => ({ data: { user: null }, error: null }),
      signInWithPassword: async () => ({ data: null, error: { message: "Supabase not configured" } }),
      signOut: async () => ({ error: null }),
      onAuthStateChange: () => ({ data: { subscription: { unsubscribe() {} } } }),
    },
  };
}

const isConfigured = Boolean(supabaseUrl && supabaseAnonKey);

if (!isConfigured && typeof window !== "undefined") {
  // eslint-disable-next-line no-console
  console.warn(
    "[v0] Supabase env vars are missing (VITE_SUPABASE_URL / VITE_SUPABASE_ANON_KEY). Running with an in-memory stub client."
  );
}

export const supabase = isConfigured
  ? createClient(supabaseUrl, supabaseAnonKey)
  : createStubClient();

export const isSupabaseConfigured = isConfigured;
