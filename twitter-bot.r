library(rtweet)

# Build the status message (text and URL)
place_details <- paste0("test")


# Post the tweet to Twitter
rtweet::post_tweet(
  status         = place_details,
  token          = nttwitterbot_token
)
