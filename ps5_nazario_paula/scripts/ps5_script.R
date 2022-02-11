################################################################################
##
## [ PROJ ] < Problem set 5 >
## [ FILE ] < Educ 260B Problem Set 5 >
## [ AUTH ] < Paula Nazario / @nazapa >
## [ INIT ] < February 8, 2022 >
## 
################################################################################

## -----------------------------------------------------------------------------
## Part I, Question 1
## git init
## -----------------------------------------------------------------------------

## -----------------------------------------------------------------------------
## Part I, Question 2 
## directory paths
getwd()
dir.create(path = "plots")
dir.create(path = "scripts")
## -----------------------------------------------------------------------------

## -----------------------------------------------------------------------------
## Part I, Question 3
## libraries
install.packages("tidyverse")
library("tidyverse")
## directory path object
plots_dir <- file.path('.','plots')
plots_dir
## **RStudio Terminal**
## git add scripts/ps5_script.R
## git commit -m "add ps5_script.R on main"
## -----------------------------------------------------------------------------

## -----------------------------------------------------------------------------
## Part II, Question 3
## load url dataset 
load(url('https://github.com/anyone-can-cook/rclass2/raw/main/data/recruiting/recruit_school_somevars.RData'))
## -----------------------------------------------------------------------------

## -----------------------------------------------------------------------------
## Part II, Question 4
df_univ <- df_school %>% 
<<<<<<< HEAD
  mutate(visited = ifelse(visits_by_110635 == 0,0,1)) %>%
  filter(state_code == "CA") %>%  
=======
<<<<<<< HEAD
  mutate(visited = ifelse(visits_by_110635 == 0,0,1)) %>%
  filter(state_code == "CA") %>%  
=======
  mutate(visited = ifelse(visits_by_126614 == 0,0,1)) %>%
  filter(state_code == "CO") %>%  
>>>>>>> dev
>>>>>>> main
  select('ncessch', 'total_students', 'avgmedian_inc_2564', 'visited')
## -----------------------------------------------------------------------------

## -----------------------------------------------------------------------------
## Part II, Question 5 
<<<<<<< HEAD
png(file.path(plots_dir, 'scatterplot_ucberkeley.png'))
=======
<<<<<<< HEAD
png(file.path(plots_dir, 'scatterplot_ucberkeley.png'))
ggplot(data = df_univ, aes(x = total_students, y = avgmedian_inc_2564, color = as.factor(visited))) +
  geom_point() +
  xlab('Total enrollment') + ylab('Average median income') +
  scale_color_discrete(name = 'Recruitment Visits', labels = c('No visits', 'Visits'))
dev.off()
## **RStudio Terminal** 
## git add scripts/ps5_script.R plots/scatterplot_ucberkeley.png
## git commit -m "add uc berkeley plot on main"
## git log
=======
png(file.path(plots_dir, 'scatterplot_cuboulder.png'))
>>>>>>> main
ggplot(data = df_univ, aes(x = total_students, y = avgmedian_inc_2564, color = as.factor(visited))) +
geom_point() +
xlab('Total enrollment') + ylab('Average median income') +
scale_color_discrete(name = 'Recruitment Visits', labels = c('No visits', 'Visits'))
dev.off()
## **RStudio Terminal** 
<<<<<<< HEAD
## git add plots/scatterplot_ucberkeley.png
## git commit -m "add uc berkeley plot on main"
=======
## git add plots/scatterplot_cuboulder.png
## git commit -m "add cu boulder plot on dev"
>>>>>>> dev
>>>>>>> main
## -----------------------------------------------------------------------------

## -----------------------------------------------------------------------------
## END SCRIPT
## -----------------------------------------------------------------------------
