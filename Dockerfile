
FROM python:alpine

WORKDIR /app

RUN apk --no-cache add git

RUN git clone https://github.com/Jacekun/AniPy.git

WORKDIR /app/AniPy

COPY docker-entrypoint.sh /app/docker-entrypoint.sh

RUN chmod +x /app/docker-entrypoint.sh

RUN pip install -r requirements.txt
RUN sed -i 's/averageScore = "{:.2f}".format(statScoreTotal\/statScoreCount \* 10)/if statScoreCount == 0:\n    averageScore = "N\/A"\nelse:\n    averageScore = "{:.2f}".format(statScoreTotal\/statScoreCount \* 10)/' /app/AniPy/func/trim_list.py 

ENV MAL=
ENV TACHI=false
ENV TRIM_LISTS=false
ENV SEPARATE_NSFW=false
ENV CLEAR_OUTPUT_FILES=false
ENV USE_ANILIST_AS_MAL=false

# Use the modified entrypoint script
ENTRYPOINT ["/app/docker-entrypoint.sh"]
