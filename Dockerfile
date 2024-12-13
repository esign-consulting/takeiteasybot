FROM python:3.14.0a2-alpine3.21
LABEL maintainer="Gustavo Muniz do Carmo <gustavo@esign.com.br>"

RUN addgroup -S takeiteasybot && adduser -S consumer -G takeiteasybot
USER consumer
WORKDIR /home/consumer
COPY --chown=consumer:takeiteasybot .twitter_keys.yaml requirements.txt ./
RUN pip3 install -r requirements.txt --user
ENV PATH=/home/consumer/.local/bin:$PATH

CMD ["search_tweets.py"]