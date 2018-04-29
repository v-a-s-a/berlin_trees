library(tidyverse)

data_root <- '/Users/vasya/Projects/berlin_trees/data'


tsv_files <- map(list.dirs(data_root, recursive = F), list.files, full.names=T) 

raw_dfs <- map(tsv_files, read_tsv, quote = '"', col_types = cols(
  WKT = col_character(),
  gml_id = col_character(),
  StandortNr = col_character(),
  Kennzeich = col_character(),
  NameNr = col_character(),
  Art_Dtsch = col_character(),
  Art_Bot = col_character(),
  GATTUNG_DEUTSCH = col_character(),
  Gattung = col_character(),
  Pflanzjahr = col_integer(),
  Standalter = col_integer(),
  Stammumfg = col_integer(),
  BaumHoehe = col_double(),
  BEZIRK = col_character(),
  Eigentuemer = col_character(),
  KroneDurch = col_integer(),
  HausNr = col_character()
))

raw_data <- raw_dfs %>% bind_rows()

