library(rtweet)
library(dplyr)

# Build A Shorty link 
# Credit: https://www.listendata.com/2021/06/how-to-shorten-urls-with-r.html

ShortURL <- function(link, linkPreview = FALSE) {
  api <- if(linkPreview) {"http://v.gd/create.php?format=json"} else {"http://is.gd/create.php?format=json"}
  query <- list(url = link)
  request <- httr::GET(api, query = query)
  content <- httr::content(request, as = "text", encoding = "utf-8")
  result <- jsonlite::fromJSON(content)
  return(result)
}

# Hashtag list
hashtags <- "#NationalTrust #EveryoneNeedsNature"

# Create Twitter token
nttwitterbot_token <- rtweet::rtweet_bot(
  api_key       = Sys.getenv("BOT_TWITTERAPIKEY"),
  api_secret    = Sys.getenv("BOT_TWITTERAPISECRETKEY"),
  access_token  = Sys.getenv("BOT_TWITTERACCESSTOKEN"),
  access_secret = Sys.getenv("BOT_TWITTERACCESSTOKENSECRET"),
  set_renv = FALSE
)

# Load the data set
ntplaces_list <- readRDS("data/places.rds")

# Randomly Chose a Place
ntplaces <- ntplaces_list %>% sample_n(size = 1)

# Get the Co-ordinates
lat <- ntplaces$`location/latitude`
lon <- ntplaces$`location/longitude`

# Create a short URL to minimize the characters required 
url_address_short <- ShortURL(ntplaces$websiteUrl)

# Get the image URL and store to a temporary location
img_url <- ntplaces$imageUrl
temp <- tempfile(fileext = ".jpeg")
download.file(img_url, temp, mode = "wb")

# Build the status message (text and URL)
place_details <- paste0(
  ntplaces$title, ". ", 
  ntplaces$description, ".\n", 
  url_address_short, " ",
  hashtags
)
# Provide alt-text description
alt_text <- paste(ntplaces$imageDescription)

# Post the tweet to Twitter
rtweet::post_tweet(
  status         = place_details,
  media          = temp,
  media_alt_text = alt_text,
  lat            = lat,
  long           = lon,
  token          = nttwitterbot_token
)
