library(data.table)
library(DBI)
library(RMariaDB)

con = dbConnect(MariaDB(), dbname = "dvf", user = "ral",
                 password = "ral", host = "127.0.0.1")

cols = c("id_mutation", "date_mutation", "nature_mutation", "valeur_fonciere",
           "code_postal", "code_commune", "nom_commune", "id_parcelle",
           "type_local", "surface_reelle_bati", "nombre_pieces_principales",
           "surface_terrain", "longitude", "latitude")

fichiers = list.files("data", pattern = r"(.csv(.gz)?$)", full.names = TRUE)

for (f in fichiers) {
  d = fread(f, select = cols,
             colClasses = list(character = c("id_mutation", "code_postal", "code_commune")))
  dbWriteTable(con, "dvf_brut", d, append = TRUE)
  message(f, " : ", nrow(d), " lignes importées")
}
dbDisconnect(con)

