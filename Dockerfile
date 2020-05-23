FROM python:3.8-slim-buster

ENV PYTHONUNBUFFERED 1

RUN apt-get update \
  # dependencies for building Python packages
  && apt-get install -y build-essential \
  # psycopg2 dependencies
  && apt-get install -y libpq-dev \
  # Translations dependencies
  && apt-get install -y gettext \
  # cleaning up unused files
  && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
  && rm -rf /var/lib/apt/lists/*

# Create and set working directory
RUN mkdir -p /usr/src/app,
WORKDIR /usr/src/app
COPY . /usr/src/app

# Requirements are installed here to ensure they will be cached.
RUN pip install pip --upgrade
RUN pip install --no-cache-dir -r requirements/production.txt

# run script to run server
EXPOSE 80
CMD sh /usr/src/app/runserver.sh
