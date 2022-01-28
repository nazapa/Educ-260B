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

## 5. Add and commit code to use in terminal: 
git add problemset4.R 
git commit -m "commit problemset4.R"   
git status  
  
# Part IV: Practice with git

##  1. Let's make some more changes to `problemset4.R`. 
##  Modify `problemset4.R` by adding a comment at the end of your 
##  file where you write down your guilty pleasure. 
##  Add the file to the staging area.

## guilty pleasure: watching tv and netflix
git add problemset4.R 

## Command to use to unstage `problemset4.R` after you've added it
git status
git reset HEAD problemset4.R 

## 2. But in the end, you decide to go ahead and commit this change anyway. 
## Re-add `problemset4.R` to the staging area and make a commit with the 
## message `my guilty pleasure`.
git add problemset4.R 
git commit -m "my guilty pleasure"  