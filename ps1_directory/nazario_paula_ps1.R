################################################################################
##
## [ PROJ ] < Problem set 1 >
## [ FILE ] < Rstudio project file >
## [ AUTH ] < Paula Nazario / GitHub handle: @nazapa >
## [ INIT ] < January 13, 2022 >
##
################################################################################

## ---------------------------
## libraries
install.packages("tidyverse")
library(tidyverse)
install.packages("readxl") 
library(readxl)
install.packages("labelled")
library("labelled")

## ---------------------------

## ---------------------------
## PART I QUESTION 4
## use 'getwd()' and 'setwd()' to get and set work directory
getwd()
setwd("/Users/paulanazario/desktop/UCLA MPP 2020-22/CLASSES 2021-22 AY/WINTER 2022/EDUC 260B - Fundamentals of Programming/rclass2")
getwd()
setwd("ps1_directory")
getwd()
list.files()

## `input_data_dir`: path to `data/` folder 
input_data_dir <- file.path('.', 'data')
input_data_dir

## `output_plot_dir`: path to `plots/` folder 
output_plot_dir <- file.path('.', 'analysis', 'plots')
output_plot_dir

## `output_file_dir`: path to `files/` folder 
output_file_dir <- file.path('.', 'analysis', 'files')
output_file_dir

## -----------------------------------------------------------------------------

## -----------------------------------------------------------------------------
## PART II QUESTION 1
## a) Print the absolute filepath of your current working directory
getwd()
## "/Users/paulanazario/Desktop/UCLA MPP 2020-22/CLASSES 2021-22 AY/WINTER 2022/EDUC 260B - Fundamentals of Programming/rclass2/ps1_directory"

## b) List all folders and files in your current working directory
list.files()
## [1] "analysis"              "data"                  "nazario_paula_ps1.R"  
## [4] "nazario_paula_ps1.Rmd" "ps1_directory.Rproj" 

## c) List all folders and files inside the `analysis/` directory
list.files(path = 'analysis' )
## "files" "plots"

## -----------------------------------------------------------------------------

## -----------------------------------------------------------------------------
## PART II QUESTION 2
## Download the data from `https://github.com/anyone-can-cook/rclass2/raw/main/data/ps2_files.zip` into your `input_data_dir`
getwd()
list.files()
download.file(url = "https://github.com/anyone-can-cook/rclass2/raw/main/data/ps2_files.zip", 
              destfile = file.path(input_data_dir, 'ps2_files.zip'))
file.path(input_data_dir, 'ps2_files.zip')

## Unzip the downloaded zipped folder and make sure the files are extracted into `input_data_dir`
unzip(zipfile = file.path(input_data_dir, 'ps2_files.zip'), 
      exdir = input_data_dir)
list.files(path = input_data_dir)

## List the contents of `input_data_dir` and copy the output as a comment in your script
list.files(path = input_data_dir)
## "college_scorecard_dict.xlsx" "college_scorecard.csv" "ps2_files.zip"  
## -----------------------------------------------------------------------------

## -----------------------------------------------------------------------------
## PART II QUESTION 3
## Read in the data from `college_scorecard.csv` and name the object `college_scorecard_df`. 
## Specify the arguments in the function you use to read in the data so that the following criteria are met:
## - Because missing values in the data are represented by `'.'`, read in the data so that these values are replaced with `NA`
## - Read in the `control` column so that it is of `integer` type

## conduct investigations 
college_scorecard_df <- read_csv(file = file.path("ps1_directory/data/college_scorecard.csv"))
college_scorecard_df
View(college_scorecard_df)
str(college_scorecard_df)

## specify the arguments
college_scorecard_df <- read_csv(file = file.path("ps1_directory/data/college_scorecard.csv"), 
                                 col_types = cols(
                                   control = col_integer()),
                                 na = ".")
college_scorecard_df
View(college_scorecard_df)
str(college_scorecard_df)

## -----------------------------------------------------------------------------

## -----------------------------------------------------------------------------
## PART II QUESTION 4
## Read in the data dictionary from `college_scorecard_dict.xlsx` and 
## name the object `college_scorecard_dict`. Specify the arguments in 
## the function you use to read in the data so that the following 
## criteria are met:
## - You are reading in the `institution_data_dictionary` sheet
## - Specify the column names to be: `'var_label', 
## 'category', 'dev_name', 'data_type', 'var_name', 
## 'val_name', 'val_label', 'source', 'notes'`
## - Since you've specified custom column names, you'll need 
## to skip the first row of data you read in (i.e., the heading row)

## before specifying arguments:
college_scorecard_dict <- read_excel("ps1_directory/data/college_scorecard_dict.xlsx", 
                                     sheet = "institution_data_dictionary")
View(college_scorecard_dict)

## after specifying arguments:
college_scorecard_dict <- read_excel("ps1_directory/data/college_scorecard_dict.xlsx", 
                                     sheet = "institution_data_dictionary", 
                                     col_names = c("var_label", "category", "dev_name", 
                                     "data_type", "var_name", "val_name", "val_label", "source", "notes"), 
                                     skip = 1)
college_scorecard_dict
View(college_scorecard_dict)

## -----------------------------------------------------------------------------

## -----------------------------------------------------------------------------
## PART III. QUESTION 1
## 1. There are a lot of variables and information in the data dictionary. 
## Let's narrow it down to include just the variables we're interested in. 
## To help prepare you for this, first perform the following investigations:
## - Use `names()` to print the column names of `college_scorecard_df` 
## (i.e., our variables of interest)
## - Use `str()` to investigate the structure of the `var_name` column in `college_scorecard_dict` 
## (_Hint_: Notice that the variable names in the data dictionary are all capitalized)
## Now, create a new object called `college_scorecard_dict_subset` from `college_scorecard_dict` where you:
## - Select only the variables: `var_name, var_label, val_name, val_label`
## - Mutate the `var_name` variable so that the variable names contained in this column are all lowercase (_Hint_: Use the `str_to_lower()` function to help)
## - Filter the dataframe so that it only contains variables that are in `college_scorecard_df` 
## (_Hint_: Use `names()` to get the variables in `college_scorecard_df`, and use `%in%` to help filter for only those variables)
 
college_scorecard_df %>% names()
## "instnm"          "control"         "tuitionfee_in"   "tuitionfee_out"  "md_earn_wne_p10"
college_scorecard_dict %>% str()
str(college_scorecard_dict$var_name)
## chr [1:2301] "UNITID" "OPEID" "OPEID6" "INSTNM" "CITY" "STABBR" "ZIP" "ACCREDAGENCY" "INSTURL" ...

college_scorecard_dict_subset <- college_scorecard_dict %>%
  select(var_name, var_label, val_name, val_label) %>%
  mutate(var_name = str_to_lower(var_name)) %>% 
  filter(var_name %in% names(college_scorecard_df))
view(college_scorecard_dict_subset)

## -----------------------------------------------------------------------------

## -----------------------------------------------------------------------------
## PART III. QUESTION 2
## Take a look at the `college_scorecard_dict_subset` object you created in the previous step. 
## You can do this by running `View(college_scorecard_dict_subset)` in the **Console** tab (bottom left panel of R Studio) 
## or clicking on the dataframe name under the **Environment** tab (top right panel of R Studio). 
## You should see the data dictionary information for the variables in your `college_scorecard_df`.
## Using the information from `college_scorecard_dict_subset`, create a new dataframe 
## called `college_scorecard_df_analysis` from `college_scorecard_df` where you add the following labels:
## - Variable labels for the 5 variables: `instnm, control, tuitionfee_in, tuitionfee_out, md_earn_wne_p10` 
## (_Hint_: Use `set_variable_labels()` to add variable labels)
## - Value labels to the `control` variable (_Hint_: Use `set_value_labels()` to add value labels)
View(college_scorecard_dict_subset)
college_scorecard_df_analysis <- college_scorecard_df %>% 
  set_variable_labels(instnm ="Institution Name", 
                      control = "Control of Institution", 
                      tuitionfee_in = "In-State Tuition & Fees", 
                      tuitionfee_out = "Out-of-State Tuition & Fees", 
                      md_earn_wne_p10 = "Median Earnings of Students Working & Not Enrolled 10 years After Entry") %>% 
  set_value_labels(control = c("Public" = 1,
                               "Private Non-Profit" = 2,
                               "Private For-Profit" = 3))
view(college_scorecard_df_analysis)
## -----------------------------------------------------------------------------

## -----------------------------------------------------------------------------
## PART III. QUESTION 3
## Create a new column in `college_scorecard_df_analysis` called `school_type` that 
## is `1` if the institution is public and `2` if it is private. 
## We'll be using this variable in the next question when we 
## visualize the data between public and private institutions.
college_scorecard_df_analysis <- college_scorecard_df_analysis %>% 
  mutate(school_type = recode(control, 
                              "1" = 1,
                              "2" = 2,
                              "3" = 2)) %>%
           set_value_labels(school_type = c("Public Institution" = 1, "Private Institution" = 2))
view(college_scorecard_df_analysis)  
## -----------------------------------------------------------------------------

## -----------------------------------------------------------------------------
## PART III. QUESTION 4
## Copy the code provided below to your script and run it. 
## This will create the following 2 scatterplots and save the plots as `.png` files in your `output_plot_dir`:
## - `out_of_state_tuition_earnings.png`: Shows the relationship between out-of-state tuition 
## of the institutions and the median earnings of their students 10 years after completion
## - `in_state_tuition_earnings.png`: Shows the relationship between in-state tuition of 
## the institutions and the median earnings of their students 10 years after completion
## After running the provided code to save the plots, add a line of code of your own that 
## lists out the contents of your `output_plot_dir`. Copy the output you see into your R script as a comment.

## Plot relationship between out-of-state tuition and median earnings
png(file.path(output_plot_dir, 'out_of_state_tuition_earnings.png'))
ggplot(college_scorecard_df_analysis, aes(x = tuitionfee_out, y = md_earn_wne_p10, color = as.factor(school_type))) +
  geom_point() +
  geom_smooth() +
  scale_color_discrete(name = 'School Type', labels = c('Public', 'Private')) +
  xlab('Tuition (Out-of-State)') + ylab('Earnings 10 years after completion')
dev.off()

## Plot relationship between in-state tuition and median earnings
png(file.path(output_plot_dir, 'in_state_tuition_earnings.png'))
ggplot(college_scorecard_df_analysis, aes(x = tuitionfee_in, y = md_earn_wne_p10, color = as.factor(school_type))) +
  geom_point() +
  geom_smooth() +
  scale_color_discrete(name = 'School Type', labels = c('Public', 'Private')) +
  xlab('Tuition (In-State)') + ylab('Earnings 10 years after completion')
dev.off()

list.files(output_plot_dir)
## [1] "in_state_tuition_earnings.png"     "out_of_state_tuition_earnings.png"

## _Note_: These plots above were created using the R library `ggplot`. 
## We won't be covering plotting in this course this quarter, but 
## if you are interested in learning more about it, here are some resources to get started:

## - [Data visualisation chapter](https://r4ds.had.co.nz/data-visualisation.html) from _R for Data Science_ by Wickham
## - [Visualization using ggplot2 lecture](https://anyone-can-cook.github.io/rclass2/lectures/ggplot/ggplot.html) from class2 last year
## -----------------------------------------------------------------------------

## -----------------------------------------------------------------------------
## PART III. QUESTION 5
## Finally, let's save some of the R objects we've created to flat files:
## - Save the `college_scorecard_df_analysis` dataframe to a file called 
## `college_scorecard_dataset.RDS` in your `output_file_dir`
## - Save the `college_scorecard_df` and `college_scorecard_dict` 
## objects to a file called `college_scorecard_objects.RData` in your `output_file_dir`
## - List the contents of `output_file_dir` and copy the output as a comment in your script
## - Also add a comment in your script to answer the following question: What are 
## the 2 main differences between an `.RDS` and `.RData` file (in terms of saving and loading the data)?

saveRDS(college_scorecard_df_analysis, 
        file = file.path(output_file_dir, 'college_scorecard_dataset.RDS'))
## use 'save' function to save more than one R object
save(college_scorecard_df, college_scorecard_dict, 
        file = file.path(output_file_dir, 'college_scorecard_objects.RData'))
list.files(output_file_dir)
## [1] "college_scorecard_dataset.RDS"   "college_scorecard_objects.RData"

## The 2 main differences between an `.RDS` and `.RData` file 
## (in terms of saving and loading the data) is that an `.RDS` 
## file is used to save a single R object, or single data frame/character 
## vector and an `.RData` file is used to save more than one R object into 
## a '.RData' file using the 'save' function. In terms of loading data, an
## `.RDS` file can be loaded again using the 'readRDS()' function and an 
## `.RData` file can be loaded again using the 'load()' function.

## -----------------------------------------------------------------------------

## -----------------------------------------------------------------------------
## Part IV: Create a GitHub issue   
## - Go to the [class repository](https://github.com/anyone-can-cook/rclass2_student_issues) and create a new issue.
## - You can either:
## - Ask a question that you have about this problem set or the course in general. 
## Make sure to assign the instructors (@ozanj, @briannawright135, @lizachavac) 
## and mention your team (e.g., @anyone-can-cook/your_team_name).
## - Share something you learned from this problem set or the course. 
## Please mention your team (e.g., @anyone-can-cook/your_team_name).
## - You are also required to respond to at least one issue posted by another student.

## - Paste the url to your issue here: 
## https://github.com/anyone-can-cook/rclass2_w22_student_issues/issues/24

## - Paste the url to the issue you responded to here: 
## https://github.com/anyone-can-cook/rclass2_w22_student_issues/issues/15
  
# Submit problem set  
  
## - Go to the [class website](https://anyone-can-cook.github.io/rclass2/) and 
## under the "Readings & Assignments" >> "Week 1" tab, click on the "Problem set 1 submission link"
## - Submit your `lastname_firstname_ps1.R` file
## - No need to submit any other files that were created
## -----------------------------------------------------------------------------

## -----------------------------------------------------------------------------
## END SCRIPT
## -----------------------------------------------------------------------------
