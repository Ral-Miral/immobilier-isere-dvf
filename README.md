# immobilier-isere-dvf

Prévision et analyse des prix immobiliers en Isère avec les données DVF (data.gouv.fr).



La table brute est issue de la concaténation des données DVF de 2022 à 2025 en France ; elle contient 15 794 129 lignes. 93,3 % de ces lignes sont des ventes classiques, le reste étant des ventes en l’état futur d’achèvement (4,9 %), des échanges, adjudications, expropriations et ventes de terrains à bâtir. 30 % des lignes concernent des logements : appartements (2 209 387) et maisons (2 535 572). 40,3 % n’ont pas de type de local (soit de simples terrains) et 26,5 % sont des dépendances. En ce qui concerne les valeurs manquantes : 1,0 % pour le prix, 2,4 % pour les coordonnées et 40,4 % pour la surface bâtie (haut car les terrains n’ont, par logique, pas de surface bâtie). Le nettoyage devra donc filtrer les ventes de maisons et d’appartements et retirer les lignes sans prix ni surface.

