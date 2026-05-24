/*
  # Create CRM tables for Deuss Studio Massage CRM

  1. New Tables
    - `clients`
      - `id` (uuid, primary key)
      - `name` (text, not null)
      - `phone` (text, default '')
      - `sold_by` (text, not null) — therapist who sold the package
      - `created_at` (timestamptz, default now())
    - `packages`
      - `id` (uuid, primary key)
      - `client_id` (uuid, foreign key → clients)
      - `service` (text, not null)
      - `sessions` (integer, not null, default 0)
      - `sessions_used` (integer, not null, default 0)
      - `paid` (numeric, not null, default 0)
      - `per_session` (numeric, not null, default 0)
      - `created_at` (timestamptz, default now())
    - `bookings`
      - `id` (uuid, primary key)
      - `client_id` (uuid, foreign key → clients)
      - `package_id` (uuid, foreign key → packages)
      - `client_name` (text, not null)
      - `therapist` (text, not null)
      - `service` (text, not null)
      - `room` (text, not null)
      - `date` (date, not null)
      - `time` (text, not null)
      - `status` (text, not null, default 'booked') — booked | done | cancelled
      - `revenue` (numeric, not null, default 0)
      - `created_at` (timestamptz, default now())
    - `history`
      - `id` (uuid, primary key)
      - `type` (text, not null)
      - `message` (text, not null)
      - `ts` (timestamptz, default now())

  2. Security
    - Enable RLS on all tables
    - Add policy for authenticated users to perform all CRUD operations on all tables
*/

CREATE TABLE IF NOT EXISTS clients (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  phone text DEFAULT '',
  sold_by text NOT NULL,
  created_at timestamptz DEFAULT now()
);

CREATE TABLE IF NOT EXISTS packages (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  client_id uuid NOT NULL REFERENCES clients(id) ON DELETE CASCADE,
  service text NOT NULL,
  sessions integer NOT NULL DEFAULT 0,
  sessions_used integer NOT NULL DEFAULT 0,
  paid numeric NOT NULL DEFAULT 0,
  per_session numeric NOT NULL DEFAULT 0,
  created_at timestamptz DEFAULT now()
);

CREATE TABLE IF NOT EXISTS bookings (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  client_id uuid NOT NULL REFERENCES clients(id) ON DELETE CASCADE,
  package_id uuid NOT NULL REFERENCES packages(id) ON DELETE CASCADE,
  client_name text NOT NULL,
  therapist text NOT NULL,
  service text NOT NULL,
  room text NOT NULL,
  date date NOT NULL,
  time text NOT NULL,
  status text NOT NULL DEFAULT 'booked',
  revenue numeric NOT NULL DEFAULT 0,
  created_at timestamptz DEFAULT now()
);

CREATE TABLE IF NOT EXISTS history (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  type text NOT NULL,
  message text NOT NULL,
  ts timestamptz DEFAULT now()
);

-- Enable RLS
ALTER TABLE clients ENABLE ROW LEVEL SECURITY;
ALTER TABLE packages ENABLE ROW LEVEL SECURITY;
ALTER TABLE bookings ENABLE ROW LEVEL SECURITY;
ALTER TABLE history ENABLE ROW LEVEL SECURITY;

-- Policies for authenticated users
CREATE POLICY "Authenticated users can read clients"
  ON clients FOR SELECT TO authenticated USING (true);

CREATE POLICY "Authenticated users can insert clients"
  ON clients FOR INSERT TO authenticated WITH CHECK (true);

CREATE POLICY "Authenticated users can update clients"
  ON clients FOR UPDATE TO authenticated USING (true) WITH CHECK (true);

CREATE POLICY "Authenticated users can delete clients"
  ON clients FOR DELETE TO authenticated USING (true);

CREATE POLICY "Authenticated users can read packages"
  ON packages FOR SELECT TO authenticated USING (true);

CREATE POLICY "Authenticated users can insert packages"
  ON packages FOR INSERT TO authenticated WITH CHECK (true);

CREATE POLICY "Authenticated users can update packages"
  ON packages FOR UPDATE TO authenticated USING (true) WITH CHECK (true);

CREATE POLICY "Authenticated users can delete packages"
  ON packages FOR DELETE TO authenticated USING (true);

CREATE POLICY "Authenticated users can read bookings"
  ON bookings FOR SELECT TO authenticated USING (true);

CREATE POLICY "Authenticated users can insert bookings"
  ON bookings FOR INSERT TO authenticated WITH CHECK (true);

CREATE POLICY "Authenticated users can update bookings"
  ON bookings FOR UPDATE TO authenticated USING (true) WITH CHECK (true);

CREATE POLICY "Authenticated users can delete bookings"
  ON bookings FOR DELETE TO authenticated USING (true);

CREATE POLICY "Authenticated users can read history"
  ON history FOR SELECT TO authenticated USING (true);

CREATE POLICY "Authenticated users can insert history"
  ON history FOR INSERT TO authenticated WITH CHECK (true);

CREATE POLICY "Authenticated users can delete history"
  ON history FOR DELETE TO authenticated USING (true);

-- Indexes for common queries
CREATE INDEX IF NOT EXISTS idx_packages_client_id ON packages(client_id);
CREATE INDEX IF NOT EXISTS idx_bookings_client_id ON bookings(client_id);
CREATE INDEX IF NOT EXISTS idx_bookings_package_id ON bookings(package_id);
CREATE INDEX IF NOT EXISTS idx_bookings_date ON bookings(date);
CREATE INDEX IF NOT EXISTS idx_history_type ON history(type);
