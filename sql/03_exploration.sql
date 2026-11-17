SELECT type_local, COUNT(*) FROM dvf_brut GROUP BY type_local;

SELECT nature_mutation, COUNT(*) FROM dvf_brut GROUP BY nature_mutation;

SELECT COUNT(*) AS total,
       SUM(valeur_fonciere IS NULL) AS sans_prix,
       SUM(surface_reelle_bati IS NULL) AS sans_surface,
       SUM(longitude IS NULL) AS sans_coord
FROM dvf_brut;

SELECT nom_commune, COUNT(DISTINCT id_mutation) AS nb_ventes
FROM dvf_brut
GROUP BY nom_commune
ORDER BY nb_ventes DESC
LIMIT 10;