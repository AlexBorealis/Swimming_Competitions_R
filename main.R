##
DT <- data.table(readxl::read_xls('Техническая заявка СШ №2 Сочи.xls', col_names = F)) |>
  rename_all(~ c('num', 'name', 'byear', 'sex', 'distance', 'time', 'coach', 'club')) |>
  mutate_if(is.POSIXct, hms::as_hms)

distances <- unique(DT$distance)

DT$sex[DT$sex %in% c('жен', 'Ж', 'Дев', 'дев', 'д')] <- 'ж'

DT$sex[DT$sex %in% c('муж', 'М', 'юн', 'мал')] <- 'м'

sexes <- unique(DT$sex)

byears <- unique(DT$byear)

by_swim(tbl = DT,
        sx = sexes[2],
        dist = distances[1],
        by = byears[1:2], races = 8)
# 
# men_swims <- sapply(distances, \(i) {
#   
#   by_swim(tbl = DT, sx = sexes[1], dist = i, by = byears[1:2], races = 8)
#   
# })
# 
# women_swims <- sapply(distances, \(i) {
#   
#   by_swim(tbl = DT, sx = sexes[2], dist = i, by = byears[1:2], races = 8)
#   
# })