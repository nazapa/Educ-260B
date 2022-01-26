################################################################################
##
## [ PROJ ] < Problem set 3 >
## [ FILE ] < R Script >
## [ AUTH ] < Paula Nazario / GitHub handle: @nazapa >
## [ INIT ] < January 25, 2022 >
##
################################################################################

## ---------------------------
## libraries
install.packages("tidyverse")
library(tidyverse)
## ---------------------------

## ---------------------------
## directory paths
data_dir <- file.path(".", "data")
data_dir
plot_dir <- file.path(".", "output", "plots")
plot_dir
file_dir <- file.path(".", "output", "files")
file_dir
## ---------------------------

## -----------------------------------------------------------------------------
## Part II, Question 2
## downloading 'HD2019.zip' file
download.file(url = "https://nces.ed.gov/ipeds/datacenter/data/HD2019.zip",
              destfile = file.path(data_dir, 'HD2019.zip'))
list.files(path = data_dir)
## unzip 'HD2019.zip' file
unzip(zipfile = file.path(data_dir, 'HD2019.zip'),
      exdir = data_dir)
list.files(path = data_dir)
## -----------------------------------------------------------------------------

## -----------------------------------------------------------------------------
## Part II, Question 3
## Read in the CSV data to a dataframe called `hd` 
hd <- read_csv(file = file.path(data_dir, "hd2019.csv"), 
               col_types = cols_only(UNITID = col_character(), 
                                     INSTNM = col_character(),
                                     STABBR = col_character(),
                                     LONGITUD = col_double(),
                                     LATITUDE = col_double()))
## -----------------------------------------------------------------------------

## -----------------------------------------------------------------------------
## Part II, Question 4 
## Filter the `hd` dataframe for only California schools & plot
hd_ca <- hd %>% filter(STABBR== 'CA')
hd_ca

png(file.path(plot_dir, 'ca_univs.png'))
ggplot(hd_ca, aes(x = LATITUDE, y = LONGITUD)) +
geom_point() + 
theme_minimal() +
coord_fixed(ratio = 1.5)
dev.off()
## -----------------------------------------------------------------------------

## -----------------------------------------------------------------------------
## Part II, Question 5
## Export `hd2019_ca.csv` inside `file_dir`
write_csv(hd_ca, file.path(file_dir, 'hd2019_ca.csv'))
## -----------------------------------------------------------------------------


## -----------------------------------------------------------------------------
## Part III: Git & GitHub
## done in git and RStudio Terminal
## -----------------------------------------------------------------------------

## -----------------------------------------------------------------------------
## Part IV: GitHub issue   
## - Paste the url to your issue here: https://github.com/anyone-can-cook/rclass2_w22_student_issues/issues/83
## - Paste the url to the issue you responded to here: https://github.com/anyone-can-cook/rclass2_w22_student_issues/issues/77
## -----------------------------------------------------------------------------

## -----------------------------------------------------------------------------
## END SCRIPT
## -----------------------------------------------------------------------------