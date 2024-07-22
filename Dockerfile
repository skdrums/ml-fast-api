FROM --platform=linux/x86_64 tiangolo/uvicorn-gunicorn-fastapi:python3.11

ENV LANG C.UTF-8
ENV PYTHONPATH /src:/app

WORKDIR /app
COPY ./requirements.txt /app/
RUN pip install -r requirements.txt
COPY src/ /app/
#
# FROM --platform=linux/x86_64 tiangolo/uvicorn-gunicorn-fastapi:python3.11
# USER root
#
# RUN apt-get update
# RUN apt-get -y install locales && \
#     localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
# ENV LANG ja_JP.UTF-8
# ENV LANGUAGE ja_JP:ja
# ENV LC_ALL ja_JP.UTF-8
# ENV TZ JST-9
# ENV TERM xterm
#
# COPY requirements.txt /root/
#
# RUN apt-get install -y vim less
# RUN pip install --upgrade pip
# RUN pip install --upgrade setuptools
#
# RUN pip install -r /root/requirements.txt