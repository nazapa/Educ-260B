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
## Download the `housing.zip` file 
input_data_dir
download.file(url="https://anyone-can-cook.github.io/rclass2/data/ps2/housing.zip", 
              destfile = file.path(input_data_dir, 'housing.zip'))
list.files(path = input_data_dir)

## Download `apa.csl` and `references.bib` file
download.file(url = "https://anyone-can-cook.github.io/rclass2/data/ps2/apa.csl",
              destfile = "./bib/apa.csl")
list.files(path = "./bib/apa.csl")
download.file(url= "https://anyone-can-cook.github.io/rclass2/data/ps2/references.bib",
              destfile = "./bib/references.bib")
list.files(path = "./bib/references.bib")

## Download `ps2_template.Rmd` file
download.file(url = "https://anyone-can-cook.github.io/rclass2/data/ps2/ps2_template.Rmd",
              destfile = "./analysis/nazario_paula_ps2.Rmd")
list.files(path = "./analysis/nazario_paula_ps2.Rmd")
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

## Question 4
## Within your text describing the data from Question 2, cite the data source. 
## Try including both in-text and parenthetical citations. Knit the Rmd file to see the results.
## _Hint_: An in-text citation looks like "Jaquette (2020) analyzed X" and a parenthetic citation 
## looks like "X is found to be better than Y (Jaquette, 2020)"

## Question 5
## By default, Pandoc uses a Chicago author-date format for citations. 
## Switch it to the APA format by specifying the `csl` parameter in the YAML header 
## of your Rmd file. Use the `apa.csl` file you saved in the `bib/` folder. 
## Knit the Rmd file to see the results.

## Question 6
## At the end of your `About the data` section, create a new R code chunk. 
## List out the contents of `data_dir` to verify that `housing.RDS` is in there. 
## Then load the `housing.RDS` file into an object called `housing_df`. 
## Display the first 10 rows of the data using this code:
```r
housing_df %>%
  head(10) %>% 
  kable() %>%
  kable_styling(latex_options = c('scale_down', 'HOLD_position'))
```
## _Note_: The table above uses the `kable()` function from `knitr` as well as 
## the `kableExtra` package. We won't be covering these in detail, but if you are 
## interested in learning more about it, here are the relevant chapters from 
## the _R Markdown Cookbook_ by Yihui Xie:
    
##    - [The function `knitr::kable()`](https://bookdown.org/yihui/rmarkdown-cookbook/kable.html)
##    - [The `kableExtra` package](https://bookdown.org/yihui/rmarkdown-cookbook/kableextra.html)

## -----------------------------------------------------------------------------

## -----------------------------------------------------------------------------
## Part IV: Creating and customizing plots
## Question 1

## Question 2

## Question 3

## Question 4

## Question 5

## Question 6

## -----------------------------------------------------------------------------

## -----------------------------------------------------------------------------
## Part V: Bonus question
## Question 1

## -----------------------------------------------------------------------------

## -----------------------------------------------------------------------------
## Part VI: Create a GitHub issue   
## Paste the url to your issue here: 
## Paste the url to the issue you responded to here: 
## -----------------------------------------------------------------------------

## -----------------------------------------------------------------------------
## END SCRIPT
## -----------------------------------------------------------------------------
