packrat::off()
setwd("/home/dflouriot/Documents/R/quizz_foot/")
packrat::on()

library(shiny)
library(shinydashboard)
library(digest) # digest() Create hash function digests for R objects
library(shinyjs)
library(DT)
library(dplyr)

load(file = "./solution/Bonne_reponses.RData")

# which fields get saved 
fieldsAll <- c("name", "favourite_team",
"q1","q2","q3","q4","q5","q6", "q7","q8","q9",
"q10","q11","q12","q13","q14","q15","q16", "q17","q18","q19",
"q20","q21","q22","q23","q24","q25","q26", "q27","q28","q29",
"q30" )

# which fields are mandatory
fieldsMandatory <- c("name", "favourite_team")

# add an asterisk to an input label
labelMandatory <- function(label) {
  tagList(
    label,
    span("*", class = "mandatory_star")
  )
}

# get current Epoch time
epochTime <- function() {
  return(as.integer(Sys.time()))
}

# get a formatted string of the timestamp (exclude colons as they are invalid
# characters in Windows filenames)
humanTime <- function() {
  format(Sys.time(), "%Y%m%d-%H%M%OS")
}

# save the results to a file
saveData <- function(data) {
  fileName <- sprintf("%s_%s.csv",
                      humanTime(),
                      digest::digest(data))
  
  write.csv(x = data, file = file.path(responsesDir, fileName),
            row.names = FALSE, quote = TRUE)
}

# load all responses into a data.frame
loadData <- function() {
  files <- list.files(file.path(responsesDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  #data <- dplyr::rbind_all(data)
  data <- do.call(rbind, data)
  data
}

# directory where responses get stored
responsesDir <- file.path("responses")

# usernames that are admins
adminUsers <- c("admin", "prof")

 

appCSS <-
  ".mandatory_star { color: red; }
   .shiny-input-container { margin-top: 25px; }
   #submit_msg { margin-left: 15px; }
   #error { color: red; }
   body { background: #fcfcfc; }
   #header { background: #fff; border-bottom: 1px solid #ddd; margin: -20px -15px 0; padding: 15px 15px 10px; }
  "
