################################################################################
##
## [ PROJ ] < Problem set 2 >
## [ FILE ] < Education 260B >
## [ AUTH ] < Paula Nazario / GitHub handle: @nazapa >
## [ INIT ] < January 18, 2022 >
##
################################################################################

## ---------------------------
## libraries
install.packages("tidyverse")
library(tidyverse)
install.packages("ggplot2")
library(ggplot2)
install.packages("scales")
library(scales)
install.packages("haven")
library(haven)
install.packages("labelled")
library(labelled)
## ---------------------------

## ---------------------------
## directory paths
getwd()
## `input_data_dir`: path to `data/` folder
input_data_dir <- file.path('.','data') 
input_data_dir
## `output_file_dir`: path to `files/` folder
output_file_dir <- file.path('.','analysis', 'files') 
output_file_dir
## ---------------------------

## -----------------------------------------------------------------------------
## Part I Question 5
## I commented out the download codes after I downloaded the data to prevent my 
## rmd files from being overwritten on.

## Download the `housing.zip` file 
##input_data_dir
##download.file(url="https://anyone-can-cook.github.io/rclass2/data/ps2/housing.zip", 
##              destfile = file.path(input_data_dir, 'housing.zip'))
##list.files(path = input_data_dir)

## Download `apa.csl` and `references.bib` file
##download.file(url = "https://anyone-can-cook.github.io/rclass2/data/ps2/apa.csl",
##              destfile = "./bib/apa.csl")
##list.files(path = "./bib/apa.csl")
##download.file(url= "https://anyone-can-cook.github.io/rclass2/data/ps2/references.bib",
##              destfile = "./bib/references.bib")
##list.files(path = "./bib/references.bib")

## Download `ps2_template.Rmd` file
##download.file(url = "https://anyone-can-cook.github.io/rclass2/data/ps2/ps2_template.Rmd",
##              destfile = "./analysis/nazario_paula_ps2.Rmd")
##list.files(path = "./analysis/nazario_paula_ps2.Rmd")
## -----------------------------------------------------------------------------

## -----------------------------------------------------------------------------
## Part II: Reading, manipulating, and writing data
## Question 1
unzip(zipfile = file.path(input_data_dir, 'housing.zip'),
      exdir = input_data_dir)
list.files(path = input_data_dir)

## Question 2
housing_df <- read_csv(file = file.path("data/housing.csv"))
View(housing_df)

## Question 3
## Use `ggplot` to create a simple scatterplot showing `median_income` 
## on the x-axis and `median_house_value` on the y-axis.
ggplot(data = housing_df, mapping = aes(x = median_income, y = median_house_value)) + geom_point()
ggplot(data = housing_df, aes(x = median_income, y = median_house_value)) + geom_point()

## Question 4
## Investigations:
housing_df %>% select(median_house_value) %>% str()
housing_df %>% select(median_house_value) %>% count()
housing_df %>% select(median_house_value) %>% 
  filter(median_house_value<500000) %>% 
  count()
housing_df %>% select(median_house_value) %>% 
  filter(median_house_value<500000)%>% 
  summary()

##  Filter the dataframe to only contain observations with `median_house_value` of 
## `500000` or less, and resassign this back to `housing_df`. If you try running 
## your code from Question 3 again, you should see that the line of points is gone.
housing_df <- housing_df %>% filter(median_house_value<=500000)
View(housing_df)
ggplot(data = housing_df, mapping = aes(x = median_income, y = median_house_value)) + geom_point()
ggplot(data = housing_df, aes(x = median_income, y = median_house_value)) + geom_point()

## Question 5
## Investigations:
housing_df$ocean_proximity
## "NEAR BAY"  "NEAR BAY"  "NEAR BAY"  "NEAR BAY"  "NEAR BAY"  "NEAR BAY"  "NEAR BAY" 
housing_df$ocean_proximity %>% str()
## chr [1:19675] "NEAR BAY" "NEAR BAY" "NEAR BAY" "NEAR BAY" "NEAR BAY" "NEAR BAY" ...
housing_df$ocean_proximity %>% typeof()
## "character"
housing_df$ocean_proximity %>% class()
## "character"
housing_df %>% select(ocean_proximity) %>% count()
## # A tibble: 1 × 1
## n
## <int>
##  1 19675
housing_df$ocean_proximity %>% summary()
## Length     Class      Mode 
## 19675 character character 

## Then, copy your code from Question 3 and update it to have the points be colored by `ocean_proximity`.
ggplot(data = housing_df, mapping = aes(x = median_income, y = median_house_value, color = ocean_proximity)) + geom_point()
ggplot(data = housing_df, aes(x = median_income, y = median_house_value, color = ocean_proximity)) + geom_point()

## Question 6
## Convert the `ocean_proximity` column into a factor with the levels in this order: 
## 'ISLAND', 'NEAR BAY', 'NEAR OCEAN', '<1H OCEAN', 'INLAND'. 
housing_df$ocean_proximity <- factor(housing_df$ocean_proximity, 
                                     levels = c('ISLAND', 'NEAR BAY', 'NEAR OCEAN', '<1H OCEAN', 'INLAND'))
## If you try running your code from Question 5 again, you should see the legend values in the updated order.
ggplot(data = housing_df, mapping = aes(x = median_income, y = median_house_value, color = ocean_proximity)) + geom_point()
ggplot(data = housing_df, aes(x = median_income, y = median_house_value, color = ocean_proximity)) + geom_point()

## Question 7
## Save your final `housing_df` dataframe to a file called `housing.RDS` inside 
## your `output_file_dir`. This will be the clean, input dataset to your RMarkdown report.
saveRDS(housing_df, 
        file = file.path(output_file_dir, 'housing.RDS'))

list.files(output_file_dir)
## -----------------------------------------------------------------------------

## -----------------------------------------------------------------------------
## Part III: RMarkdown report and citations
## see Rmd file
## -----------------------------------------------------------------------------

## -----------------------------------------------------------------------------
## Part IV: Creating and customizing plots
## see Rmd file
## -----------------------------------------------------------------------------

## -----------------------------------------------------------------------------
## Part V: Bonus question
## see Rmd file
## -----------------------------------------------------------------------------

## -----------------------------------------------------------------------------
## Part VI: Create a GitHub issue   
## Paste the url to your issue here: https://github.com/anyone-can-cook/rclass2_w22_student_issues/issues/53
## Paste the url to the issue you responded to here: https://github.com/anyone-can-cook/rclass2_w22_student_issues/issues/52
## -----------------------------------------------------------------------------

## -----------------------------------------------------------------------------
## END SCRIPT
## -----------------------------------------------------------------------------
