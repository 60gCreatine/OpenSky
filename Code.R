library(httr)
library(jsonlite)

url <- "https://opensky-network.org/api/states/all"
bermuda_triangle_bbox <- list(
  minLatitude = 18.4663,
  maxLatitude = 32.3214,
  minLongitude = -80.1903,
  maxLongitude = -64.7574
)

readRenviron(".Renviron")
username <- Sys.getenv("username") 
password <- Sys.getenv("password")

response <- GET(url, query = bermuda_triangle_bbox, authenticate(username, password))

data <- fromJSON(content(response, as = "text"), flatten = T)

df <- as.data.frame(data$states)