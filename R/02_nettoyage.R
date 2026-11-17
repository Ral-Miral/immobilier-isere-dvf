library(data.table)
library(DBI)
library(RMariaDB)

con = dbConnect(MariaDB(), dbname = "dvf", user = "ral",
                 password = "ral", host = "127.0.0.1")
dvf = as.data.table(dbReadTable(con, "dvf_logements"))
dbDisconnect(con)

dvf[, prix_m2 := valeur_fonciere / surface_reelle_bati]

dvf_clean = dvf[
  valeur_fonciere >= 10000 &
    surface_reelle_bati >= 9 & surface_reelle_bati <= 400 &
    prix_m2 >= 500 & prix_m2 <= 10000
]

cat("Lignes avant :", nrow(dvf), "\n")
cat("Lignes après :", nrow(dvf_clean), "\n")
cat("Perte (%) :", round(100 * (1 - nrow(dvf_clean) / nrow(dvf)), 2), "\n")
print(summary(dvf_clean$prix_m2))

con = dbConnect(MariaDB(), dbname = "dvf", user = "ral",
                 password = "ral", host = "127.0.0.1")
dbWriteTable(con, "dvf_propre", dvf_clean, overwrite = TRUE)
dbDisconnect(con)