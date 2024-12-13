FROM python:3.14.0a2-alpine3.21
LABEL maintainer="Gustavo Muniz do Carmo <gustavo@esign.com.br>"

RUN addgroup -S esignbr && adduser -S searchtweets-v2 -G esignbr
USER searchtweets-v2
WORKDIR /home/searchtweets-v2
COPY --chown=searchtweets-v2:esignbr .twitter_keys.yaml requirements.txt ./
RUN pip3 install -r requirements.txt --user
ENV PATH=/home/searchtweets-v2/.local/bin:$PATH

ENTRYPOINT ["search_tweets.py"]