# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

file <- "educationmapper_data.xlsx"

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
edumap_readfile("educationmapper_data.xlsx")

