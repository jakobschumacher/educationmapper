
library(tidyverse)


edumap_checkfile <- function(file) {
  sheets <- readxl::excel_sheets(file)
  if("Courses" %in% sheets){
    print("Checking availability of courses ......... TRUE" )
  }
  if("Participants" %in% sheets){
    print("Checking availability of participants .... TRUE" )
  } else {
    print("No sheet with 'participants' found. Some graphs wont be possible")
  }
  if("Institutions" %in% sheets){
    print("Checking availability of institutions .... TRUE" )
  }
  if("Topics" %in% sheets){
    print("Checking availability of topics .......... TRUE" )
  }
}

edumap_createmap <- function(file) {
  rmarkdown::render("report.Rmd")
  }

edumap_readfile <- function(file){
  sheets <- readxl::excel_sheets(file)
  if("Courses" %in% sheets){
    courses <- readxl::read_excel(file, sheet = "Courses")
  }
  if("Participants" %in% sheets){
    participants <- readxl::read_excel(file, sheet = "Participants")
  }
  if("Institutions" %in% sheets){
    institutions <- readxl::read_excel(file, sheet = "Institutions")
  }
  if("Topics" %in% sheets){
    topics <- readxl::read_excel(file, sheet = "Topics")
  }
  save.image(file = "contents_of_excelfile.RData")
  # Hier bräuchte ich Hilfe: Wie kann das am besten gemacht werden, dass diese Variablen immer eingelesen werden

}

