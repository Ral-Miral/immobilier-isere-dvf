CREATE TABLE dvf_logements AS
SELECT d.*
FROM dvf_38 d
JOIN (
    SELECT id_mutation
    FROM dvf_38
    WHERE nature_mutation = 'Vente'
      AND type_local IN ('Maison', 'Appartement')
    GROUP BY id_mutation
    HAVING COUNT(*) = 1
) m ON d.id_mutation = m.id_mutation
WHERE d.nature_mutation = 'Vente'
  AND d.type_local IN ('Maison', 'Appartement')
  AND d.valeur_fonciere > 0
  AND d.surface_reelle_bati > 0;