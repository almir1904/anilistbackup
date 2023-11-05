# Use Alpine Linux as the base image
FROM python:alpine

WORKDIR /app

RUN apk --no-cache add git

RUN git clone https://github.com/Jacekun/AniPy.git

WORKDIR /app/AniPy

RUN pip install -r requirements.txt

CMD ["python", "anipy.py", "-user", "${ANIUser}", "-mal", "${MALUser}", "--t"]
