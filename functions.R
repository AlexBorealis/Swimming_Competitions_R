by_swim <- function(tbl,
                    sx,
                    dist,
                    by,
                    races = 5) {
  
  r <- 1:races
  n <- c(0, rep(1:ceiling(length(r)/2), each = 2)[1:length(r) - 1] )
  
  num_race <- map2_int(r, n, \(i, j) {
    
    if (i == 1) {
      
      r[i] <- floor(median(r))
      
    } else 
      if (i %% 2 == 0) {
        
        r[i] <- floor(median(r)) + j
        
      } else {
        
        r[i] <- floor(median(r)) - j
        
      }
    
  })
  
  new_tbl <- DT[sex == sx & distance == dist & byear %in% by]
  
  new_tbl[order(distance, time)] %>%
    .[, .(swim = rep(1:ceiling( nrow(.)/races), each = races)[1:nrow(.)],
          race = num_race,
          name,
          byear,
          distance,
          time,
          coach,
          club)] %>%
    group_by(swim) %>%
    arrange(race, .by_group = T) %>%
    split(f = rep(1:ceiling( nrow(.)/races ), each = races)[1:nrow(.)]) %>%
    suppressWarnings()
    
}
