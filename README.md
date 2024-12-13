# consumer

Take It Easy Bot Consumer project.

Based on [searchtweets-v2](https://github.com/twitterdev/search-tweets-python/tree/v2).

## Setup

To prepare your local Python environment, execute:

`python3 -m venv env && source env/bin/activate && pip install -r requirements.txt`

Or if you are going to use Docker, build the image:

`docker build -t esignbr/searchtweets-v2 .`

## CLI

Command line tool help:

`search_tweets.py -h`

## Credentials

Place in `~/.twitter_keys.yaml` the content like below:

```yml
---
search_tweets_v2:
  endpoint:  https://api.twitter.com/2/tweets/search/recent
  consumer_key: <CONSUMER_KEY>
  consumer_secret: <CONSUMER_SECRET>
```

Alternatively, if Docker will be used to run the consumer, place in `.env` the content like below:

```env
SEARCHTWEETS_ENDPOINT=https://api.twitter.com/2/tweets/search/recent
SEARCHTWEETS_CONSUMER_KEY=<CONSUMER_KEY>
SEARCHTWEETS_CONSUMER_SECRET=<CONSUMER_SECRET>
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

Or

```bash
docker run --rm --env-file .env esignbr/searchtweets-v2 \
  --max-tweets 10 \
  --query "(asshole OR bastard OR cretin OR idiot OR jerk OR retard OR stupid OR twat) lang:en" \
  --filename-prefix aggressive_tweets_candidates \
  --print-stream
```

More about queries in [here](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule).

Maximum tweets consumption per month: 500.000 tweets (for free). Frequency intended for consuming: 10 tweets per minute.
