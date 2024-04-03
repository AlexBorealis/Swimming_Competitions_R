## Load packages
source(paste0(getwd(), '/required_pckgs.R'), local = T)

## Load functions
source(paste0(getwd(), '/functions.R'), local = T)

DT <- data.table(readxl::read_xls('Техническая заявка СШ №2 Сочи.xls', col_names = F)) |>
  rename_all(~ c('num', 'name', 'byear', 'sex', 'distance', 'time', 'coach', 'club')) |>
  mutate_if(is.POSIXct, hms::as_hms)

distances <- unique(DT$distance)

sexes <- unique(DT$sex)

byears <- unique(DT$byear)

by_swim(tbl = DT, sx = sexes[1], dist = distances[5], by = byears[1], races = 5)
