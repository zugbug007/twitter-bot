[![ntplacesbot](https://github.com/zugbug007/twitter-bot/actions/workflows/ntplacesbot.yml/badge.svg?event=schedule)](https://github.com/zugbug007/twitter-bot/actions/workflows/ntplacesbot.yml)
# National Trust Places Twitter Bot

[NatTrustPlaces](https://twitter.com/NatTrustPlaces) is a simple twitter bot written using R to publish information about the National Trust properties in the UK and NI. This bot is inspired by [Matt Dray](https://github.com/matt-dray/)'s [londonmapbot](https://github.com/matt-dray/londonmapbot) which randomly tweets a location in London every 30 minutes. 

This bot uses an archive of over 500 properties from the National Trust to tweet the place name, description, image and co-ordinates about a randomly chosen place in the UK and NI.  

The Bot works as follows:
* Loads a data set of approx. 500 National Trust places.
* Randomly chooses a single place from the data.
* Downloads the location image for the place.
* Builds the tweet using the name, description, image, co-ordinates and hashtags.
* Posts the tweet via the twitter API.
* Scheduled using Github Actions for twice per day.
