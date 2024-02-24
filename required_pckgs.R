# Load packages
library(httr2)
library(conflicted, warn.conflicts = F)
library(tidyverse, warn.conflicts = F)
conflicts_prefer(dplyr::select(),
                 dplyr::filter(),
                 dplyr::lag(),
                 dplyr::lead(),
                 data.table::`:=`)
library(data.table, warn.conflicts = F)
setDTthreads(0)
library(stringr)
library(stringi, warn.conflicts = F)
library(rlang, warn.conflicts = F)
library(rvest)
library(purrr, warn.conflicts = F)
library(readtext, warn.conflicts = F)
library(qdapRegex, warn.conflicts = F)
library(openxlsx)