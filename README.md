# consumer

Take It Easy Bot Consumer project.

Based on [searchtweets-v2](https://github.com/twitterdev/search-tweets-python/tree/v2).

## Setup

`python3 -m venv env && source env/bin/activate && pip install -r requirements.txt`

## CLI

Command line tool help:

`search_tweets.py -h`

## Credentials

Place in `~/.twitter_keys.yaml` with the content like below:

```yml
---
search_tweets_api:
  endpoint:  https://api.twitter.com/2/tweets/search/recent
  consumer_key: <CONSUMER_KEY>
  consumer_secret: <CONSUMER_SECRET>
```

## Consuming

Save the results in `aggressive_tweets_candidates.json`.

```bash
search_tweets.py \
  --max-tweets 10 \
  --query "(asshole OR bastard OR cretin OR idiot OR jerk OR retard OR stupid OR twat) lang:en" \
  --filename-prefix aggressive_tweets_candidates \
  --print-stream
```

More about queries in [here](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule).
