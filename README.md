# Prix de l'immobilier en Isère (DVF)

Analyse des ventes de logements en Isère à partir des données DVF (Demandes de valeurs foncières), de la collecte jusqu'au tableau de bord.

## Objectif
Décrire et modéliser l'évolution du prix au m² des maisons et appartements par commune et par année.

## Données
- Source : data.gouv.fr, "Demandes de valeurs foncières géolocalisées" (Licence Ouverte).
- Période : 4 années, France entière à l'import (15,8 millions de lignes), puis filtrage sur l'Isère (code commune 38).

## Chaîne de traitement
1. R (**R/01_import.R**) : import des CSV dans MariaDB.
2. SQL (**sql/**) : tables, index, filtrage Isère et ventes de logements.
3. R (**R/02_nettoyage.R**) : calcul du prix au m², retrait des valeurs aberrantes.
4. R (**R/03_analyse.R**) : statistiques descriptives et modèles.
5. Power BI (**powerbi/**) : tableau de bord connecté à la base.

## Choix méthodologiques
- Ventes classiques uniquement (exclusion des VEFA, échanges, adjudications, expropriations, terrains à bâtir).
- Maisons et appartements uniquement.
- Une seule ligne de logement par vente : les ventes portant sur plusieurs logements partagent un seul prix, donc le prix au m² de chaque bien n'est pas calculable. Cela exclut une partie des ventes.
- Filtres : prix supérieur ou égal à 10 000 €, surface bâtie entre 9 et 400 m², prix au m² entre 500 et 10 000 €. Le plafond de 10 000 €/m² est volontairement élevé pour conserver les stations de ski.
- Résultat : 61 947 ventes avant nettoyage, 61 209 après (perte de 1,2 %).

## Résultats
.
.
.
.
.

## Limites
- Les surfaces et prix sont déclaratifs et contiennent des erreurs de saisie.
- Les ventes multi-logements sont exclues.
- Pas de variables sur l'état du bien, l'étage ou les travaux.
- Une vente est datée à l'acte, pas à la mise en vente.

## Reproduire le projet
1. Installer MariaDB et créer la base **dvf** et l'utilisateur **ral** de mot de passe **ral**.
2. Télécharger les CSV DVF dans **data/** (ignoré par Git).
3. Exécuter dans l'ordre les scripts de **sql/** et de **R/**.
4. Ouvrir **powerbi/** et pointer la source vers la base locale.

## Outils
SQL, R, Power BI, Git/GitHub.