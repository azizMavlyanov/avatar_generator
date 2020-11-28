FROM python:3.4-alpine

RUN addgroup -S uwsgi-group && adduser -S uwsgi-user -G uwsgi-group

RUN apk add --no-cache gcc libc-dev linux-headers dos2unix bash

ADD . /code
WORKDIR /code

RUN dos2unix ./uwsgi.sh

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

USER uwsgi-user

CMD ["python", "app.py"]
