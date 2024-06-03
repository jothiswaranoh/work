CREATE TABLE lm_licenses_copy (
    deal_name TEXT NOT NULL, deal_type TEXT, execution_date DATE, term_start_date DATE, term_end_date DATE, grantor_legal_name TEXT, grantee_legal_name TEXT, grantor_entity TEXT, grantee_entity TEXT, deal_notes TEXT, business_unit TEXT, broker_name TEXT, fee_type TEXT, fee_thousands_usd TEXT, fee_notes TEXT, deal_lead TEXT, legal_lead TEXT, business_unit_id TEXT, deal_lead_user_id TEXT, legal_lead_user_id TEXT, related_encumbrance_id INTEGER, verified_by TEXT, published_by TEXT, published_at TIMESTAMP, published_count TEXT, created_by TEXT NOT NULL, created_at TIMESTAMP DEFAULT now(), updated_by TEXT NOT NULL, updated_at TIMESTAMP DEFAULT now()
);

CREATE TABLE right_copy (
    right_name TEXT, right_start_date DATE, right_end_date DATE, field_of_use TEXT, referring_section TEXT, notes TEXT, deal_name TEXT NOT NULL, created_at TIMESTAMP DEFAULT now(), updated_at TIMESTAMP DEFAULT now()
);

CREATE TABLE restriction_copy (
    restriction_name TEXT, restriction_start_date DATE, restriction_end_date DATE, created_at TIMESTAMP DEFAULT now(), updated_at TIMESTAMP DEFAULT now(), deal_name TEXT NOT NULL,
);

CREATE TABLE assets_copy (
    portfolio TEXT, asset_number INTEGER, title TEXT, filing_date DATE, created_at TIMESTAMP DEFAULT now(), updated_at TIMESTAMP DEFAULT now(), deal_name TEXT,);