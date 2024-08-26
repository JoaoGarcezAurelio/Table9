# Key packages for the app

#  install.packages("shiny") # For the shiny app
#  install.packages("bslib") # For certain shiny app traits
#  install.packages("readr") # For loading csv
#  install.packages("shinythemes") # For shiny themes
#  install.packages("thematic") # For consistence between layout and plots
#  install.packages("reactable") # For table
#  install.packages("reactablefmtr") # For table
#  install.packages("here") # For file management
#  install.packages("shinylive") # For github optimisation
#  install.packages("htmltools") # For the DOI links
#  install.packages("magrittr") # For the pipe (avoided tidyverse in case it makes it more difficult for shinyserver)
#  install.packages("dplyr") # For the mutate functions 

# Loading the packages

library(shiny) 
library(bslib)
library(readr)
library(shinythemes)
library(thematic)
library(reactable)
library(reactablefmtr)
library(here)
library(shinylive)
library(htmltools)
library(magrittr)
library(dplyr)


# Uploading the table

Table9 <- 
  read_csv(here("Data",
                "Processed Data",
                "Table9.csv"))

# Now I create the colour code I want the classification variable to have:

Table9 <- Table9 %>%
  mutate(
    Classification_colours = case_when(Classification == "High" ~ "darkgreen",
                                       Classification == "Low" ~ "red",
                                       TRUE ~ "orange")
  )

# Creating a tooltip option that will be used in the headers.

with_tooltip <- function(value, tooltip) {
  tags$abbr(style = "text-decoration: underline; text-decoration-style: dotted; cursor: help",
            title = tooltip, value)
}


# I will need a different DOI table for Table 9:

DOITable9 <- data.frame(
  Study_ID = c("3", "15", "16", "10", "12", "17", "29", "10", "18", "18", 
               "15", "12", "18", "29", "15", "16", "8", "10", "12", "17",
               "18", "29", "16", "8", "10", "12", "17", "18", "29", "11", "29"),
  DOI = c("https://doi.org/10.1093/her/cyu047",
          "https://doi.org/10.1186/s40359-016-0133-4",
          "https://doi.org/10.1002/ajcp.12092",
          "https://doi.org/10.1080/02796015.2007.12087949",
          "https://doi.org/10.1007/s11121-017-0802-4",
          "https://doi.org/10.1007/s11121-018-0948-8",
          "https://doi.org/10.3310/phr06100",
          "https://doi.org/10.1080/02796015.2007.12087949",
          "https://doi.org/10.1007/s11121-012-0359-1",
          "https://doi.org/10.1007/s11121-012-0359-1",
          "https://doi.org/10.1186/s40359-016-0133-4",
          "https://doi.org/10.1007/s11121-017-0802-4",
          "https://doi.org/10.1007/s11121-012-0359-1",
          "https://doi.org/10.3310/phr06100",
          "https://doi.org/10.1186/s40359-016-0133-4",
          "https://doi.org/10.1002/ajcp.12092",
          "http://dx.doi.org/10.1016/j.jsp.2014.07.001",
          "https://doi.org/10.1080/02796015.2007.12087949",
          "https://doi.org/10.1007/s11121-017-0802-4",
          "https://doi.org/10.1007/s11121-018-0948-8",
          "https://doi.org/10.1007/s11121-012-0359-1",
          "https://doi.org/10.3310/phr06100",
          "https://doi.org/10.1002/ajcp.12092",
          "http://dx.doi.org/10.1016/j.jsp.2014.07.001",
          "https://doi.org/10.1080/02796015.2007.12087949",
          "https://doi.org/10.1007/s11121-017-0802-4",
          "https://doi.org/10.1007/s11121-018-0948-8",
          "https://doi.org/10.1007/s11121-012-0359-1",
          "https://doi.org/10.3310/phr06100",
          "https://doi.org/10.1186/isrctn85087674",
          "https://doi.org/10.3310/phr06100"))
