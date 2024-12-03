library(httr)
library(jsonlite)

url <- "https://opensky-network.org/api/states/all"
bermuda_triangle_bbox <- list(
  lamin = 18.4663,
  lamax = 32.3214,
  lomin = -80.1903,
  lomax = -64.7574
)

#readRenviron(".Renviron")
#username <- Sys.getenv("username") 
#password <- Sys.getenv("password")

username <- Sys.getenv("OpenSkyUsername")
password <- Sys.getenv("OpenSkyPassword")


response <- GET(url, query = bermuda_triangle_bbox, authenticate(username, password))

data <- fromJSON(content(response, as = "text"), flatten = T)

df <- as.data.frame(data$states)

  