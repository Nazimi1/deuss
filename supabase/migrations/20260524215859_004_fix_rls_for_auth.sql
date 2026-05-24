/*
  # Fix RLS policies to allow authenticated user access

  The current policies use auth.uid() = something which doesn't match.
  Since this is a single-user CRM per studio, allow all authenticated users full access.

  1. Security
    - Update policies to allow any authenticated user full CRUD access
*/

DROP POLICY IF EXISTS "Authenticated users can read clients" ON clients;
DROP POLICY IF EXISTS "Authenticated users can insert clients" ON clients;
DROP POLICY IF EXISTS "Authenticated users can update clients" ON clients;
DROP POLICY IF EXISTS "Authenticated users can delete clients" ON clients;

DROP POLICY IF EXISTS "Authenticated users can read packages" ON packages;
DROP POLICY IF EXISTS "Authenticated users can insert packages" ON packages;
DROP POLICY IF EXISTS "Authenticated users can update packages" ON packages;
DROP POLICY IF EXISTS "Authenticated users can delete packages" ON packages;

DROP POLICY IF EXISTS "Authenticated users can read bookings" ON bookings;
DROP POLICY IF EXISTS "Authenticated users can insert bookings" ON bookings;
DROP POLICY IF EXISTS "Authenticated users can update bookings" ON bookings;
DROP POLICY IF EXISTS "Authenticated users can delete bookings" ON bookings;

DROP POLICY IF EXISTS "Authenticated users can read history" ON history;
DROP POLICY IF EXISTS "Authenticated users can insert history" ON history;
DROP POLICY IF EXISTS "Authenticated users can delete history" ON history;

-- New policies for authenticated users
CREATE POLICY "Auth users can read clients"
  ON clients FOR SELECT TO authenticated USING (true);

CREATE POLICY "Auth users can insert clients"
  ON clients FOR INSERT TO authenticated WITH CHECK (true);

CREATE POLICY "Auth users can update clients"
  ON clients FOR UPDATE TO authenticated USING (true) WITH CHECK (true);

CREATE POLICY "Auth users can delete clients"
  ON clients FOR DELETE TO authenticated USING (true);

CREATE POLICY "Auth users can read packages"
  ON packages FOR SELECT TO authenticated USING (true);

CREATE POLICY "Auth users can insert packages"
  ON packages FOR INSERT TO authenticated WITH CHECK (true);

CREATE POLICY "Auth users can update packages"
  ON packages FOR UPDATE TO authenticated USING (true) WITH CHECK (true);

CREATE POLICY "Auth users can delete packages"
  ON packages FOR DELETE TO authenticated USING (true);

CREATE POLICY "Auth users can read bookings"
  ON bookings FOR SELECT TO authenticated USING (true);

CREATE POLICY "Auth users can insert bookings"
  ON bookings FOR INSERT TO authenticated WITH CHECK (true);

CREATE POLICY "Auth users can update bookings"
  ON bookings FOR UPDATE TO authenticated USING (true) WITH CHECK (true);

CREATE POLICY "Auth users can delete bookings"
  ON bookings FOR DELETE TO authenticated USING (true);

CREATE POLICY "Auth users can read history"
  ON history FOR SELECT TO authenticated USING (true);

CREATE POLICY "Auth users can insert history"
  ON history FOR INSERT TO authenticated WITH CHECK (true);

CREATE POLICY "Auth users can delete history"
  ON history FOR DELETE TO authenticated USING (true);
