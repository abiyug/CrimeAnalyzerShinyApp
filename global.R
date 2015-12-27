################################################################################
# Developer Name: Abiyu Giday                                                  #
# Date: 12/24/2015                                                             #
# Description:  This crime analyzer shiny web app is developed                 #
#               for a project in Coursera Data Science Specialization course.  #
################################################################################

# Load library #
library(shiny)
library(leaflet)
library(RColorBrewer)
library(rgdal)
library(raster)
library(ggmap)
library(dplyr)

# Read in the data & sample one thousand  the  more serious crimes ##
df1 <- read.csv("./data/huston-crime.csv")
df2 <- subset(df1, offense != "auto theft" & offense != "theft" & offense != "burglary")
df3 <- sample_n(df2, 1000)  


## tidy data - split, keep only the time portion of the date-time variable, combine dataframe back ##
df4 <- df3 %>%  select(time) %>% mutate( time = substr(time, 12,19))
df3[,2] <- NULL
df5 <- cbind(df3,df4)

## Final data frame to work with ##
hustonCrime <- df5


