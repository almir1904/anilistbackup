
FROM python:alpine

WORKDIR /app

RUN apk --no-cache add git

RUN git clone https://github.com/Jacekun/AniPy.git

WORKDIR /app/AniPy

COPY docker-entrypoint.sh /app/docker-entrypoint.sh
COPY trim_list.py /app/AniPy/func/trim_list.py

RUN chmod +x /app/docker-entrypoint.sh

RUN pip install -r requirements.txt

ENV TACHI=false
ENV TRIM_LISTS=false
ENV SEPARATE_NSFW=false
ENV CLEAR_OUTPUT_FILES=false
ENV USE_ANILIST_AS_MAL=false

# Use the modified entrypoint script
ENTRYPOINT ["/app/docker-entrypoint.sh"]
