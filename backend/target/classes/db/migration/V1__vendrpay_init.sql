-- ============================
-- BUSINESS (Company using VendrPay)
-- ============================
CREATE TABLE businesses (
    id SERIAL PRIMARY KEY,
    name VARCHAR(120) NOT NULL,
    address TEXT,
    phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================
-- USERS (RBAC)
-- ============================
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    business_id INT REFERENCES businesses(id) ON DELETE CASCADE,
    name VARCHAR(120) NOT NULL,
    email VARCHAR(120) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL,   -- ADMIN, STAFF, VIEWER, SUPERADMIN
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================
-- CUSTOMERS (Credit Buyers)
-- ============================
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    business_id INT REFERENCES businesses(id) ON DELETE CASCADE,
    name VARCHAR(120) NOT NULL,
    phone VARCHAR(20),
    business_name VARCHAR(120),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================
-- CHALLANS (Invoices / Delivery Notes)
-- ============================
CREATE TABLE challans (
    id SERIAL PRIMARY KEY,
    business_id INT REFERENCES businesses(id) ON DELETE CASCADE,
    customer_id INT REFERENCES customers(id) ON DELETE CASCADE,
    total_amount NUMERIC(12,2) NOT NULL,
    due_date DATE NOT NULL,
    status VARCHAR(20) DEFAULT 'PENDING', -- PENDING, PARTIAL, PAID
    proof_url TEXT,                       -- Photo/Signature/PDF
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================
-- PAYMENTS (Partial / Full)
-- ============================
CREATE TABLE payments (
    id SERIAL PRIMARY KEY,
    business_id INT REFERENCES businesses(id) ON DELETE CASCADE,
    challan_id INT REFERENCES challans(id) ON DELETE CASCADE,
    paid_amount NUMERIC(12,2) NOT NULL,
    payment_mode VARCHAR(20),         -- UPI, CASH, BANK, CHEQUE
    paid_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================
-- REMINDERS (Log of SMS/WhatsApp)
-- ============================
CREATE TABLE reminders (
    id SERIAL PRIMARY KEY,
    business_id INT REFERENCES businesses(id) ON DELETE CASCADE,
    challan_id INT REFERENCES challans(id) ON DELETE CASCADE,
    medium VARCHAR(20),               -- SMS, WHATSAPP
    delivered BOOLEAN DEFAULT FALSE,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================
-- AUDIT LOGS (optional but useful)
-- ============================
CREATE TABLE audit_logs (
    id SERIAL PRIMARY KEY,
    business_id INT REFERENCES businesses(id),
    user_id INT REFERENCES users(id),
    action VARCHAR(255),
    detail TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
