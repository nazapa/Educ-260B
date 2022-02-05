## Part III: Manipulating data in R
## install packages
install.packages("tidyverse")
library("tidyverse")
## loading data and creating pivot table
mrc <- read_csv(url("http://www.equality-of-opportunity.org/data/college/mrc_table2.csv"))
mrc_subset <- mrc %>% select(name, par_q1, par_q2, par_q3, par_q4, par_q5)
mrc_pivot <- mrc_subset %>% 
  pivot_longer(cols = starts_with("par_"),
               names_to = "quintile",
               names_prefix = "par_",
               values_to = "fraction",
  )