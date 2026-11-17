CREATE INDEX idx_commune ON dvf_brut (code_commune);
CREATE INDEX idx_date ON dvf_brut (date_mutation);
CREATE INDEX idx_type ON dvf_brut (type_local);
CREATE INDEX idx_mutation ON dvf_brut (id_mutation);