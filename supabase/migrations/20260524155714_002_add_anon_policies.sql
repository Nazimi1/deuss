/*
  # Add anon access policies for CRM tables

  The app currently has no login flow, so data must be accessible via the anon key.
  These policies allow full CRUD for the anon role on all CRM tables.

  1. Security
    - Add SELECT/INSERT/UPDATE/DELETE policies for anon role on clients, packages, bookings, history
*/

CREATE POLICY "Anon users can read clients"
  ON clients FOR SELECT TO anon USING (true);

CREATE POLICY "Anon users can insert clients"
  ON clients FOR INSERT TO anon WITH CHECK (true);

CREATE POLICY "Anon users can update clients"
  ON clients FOR UPDATE TO anon USING (true) WITH CHECK (true);

CREATE POLICY "Anon users can delete clients"
  ON clients FOR DELETE TO anon USING (true);

CREATE POLICY "Anon users can read packages"
  ON packages FOR SELECT TO anon USING (true);

CREATE POLICY "Anon users can insert packages"
  ON packages FOR INSERT TO anon WITH CHECK (true);

CREATE POLICY "Anon users can update packages"
  ON packages FOR UPDATE TO anon USING (true) WITH CHECK (true);

CREATE POLICY "Anon users can delete packages"
  ON packages FOR DELETE TO anon USING (true);

CREATE POLICY "Anon users can read bookings"
  ON bookings FOR SELECT TO anon USING (true);

CREATE POLICY "Anon users can insert bookings"
  ON bookings FOR INSERT TO anon WITH CHECK (true);

CREATE POLICY "Anon users can update bookings"
  ON bookings FOR UPDATE TO anon USING (true) WITH CHECK (true);

CREATE POLICY "Anon users can delete bookings"
  ON bookings FOR DELETE TO anon USING (true);

CREATE POLICY "Anon users can read history"
  ON history FOR SELECT TO anon USING (true);

CREATE POLICY "Anon users can insert history"
  ON history FOR INSERT TO anon WITH CHECK (true);

CREATE POLICY "Anon users can delete history"
  ON history FOR DELETE TO anon USING (true);
