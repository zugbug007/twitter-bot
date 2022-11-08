library(rtweet)

# Create Twitter token
nttwitterbot_token <- rtweet::rtweet_bot(
  api_key       = Sys.getenv("BOT_TWITTERAPIKEY"),
  api_secret    = Sys.getenv("BOT_TWITTERAPISECRETKEY"),
  access_token  = Sys.getenv("BOT_TWITTERACCESSTOKEN"),
  access_secret = Sys.getenv("BOT_TWITTERACCESSTOKENSECRET")
)

# Build the status message (text and URL)
place_details <- paste0("test")

# Post the tweet to Twitter
rtweet::post_tweet(
  status         = place_details,
  token          = nttwitterbot_token
)
