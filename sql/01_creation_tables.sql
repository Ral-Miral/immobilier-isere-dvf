USE dvf;
CREATE TABLE dvf_brut (
id_mutation VARCHAR(20),
date_mutation DATE,
nature_mutation VARCHAR(50),
valeur_fonciere DECIMAL(15,2),
code_postal VARCHAR(5),
code_commune VARCHAR(5),
nom_commune VARCHAR(100),
id_parcelle VARCHAR(20),
type_local VARCHAR(50),
surface_reelle_bati INT,
nombre_pieces_principales INT,
surface_terrain INT,
longitude DOUBLE,
latitude DOUBLE
);