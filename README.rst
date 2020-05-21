caproverdj
==========

A basic web app to help configure caprover with django

.. image:: https://img.shields.io/badge/built%20with-Cookiecutter%20Django-ff69b4.svg
     :target: https://github.com/pydanny/cookiecutter-django/
     :alt: Built with Cookiecutter Django
.. image:: https://img.shields.io/badge/code%20style-black-000000.svg
     :target: https://github.com/ambv/black
     :alt: Black code style


:License: MIT


Settings
--------

Moved to settings_.

.. _settings: http://cookiecutter-django.readthedocs.io/en/latest/settings.html

Basic Commands
--------------

Setting Up Your Users
^^^^^^^^^^^^^^^^^^^^^

* To create a **normal user account**, just go to Sign Up and fill out the form. Once you submit it, you'll see a "Verify Your E-mail Address" page. Go to your console to see a simulated email verification message. Copy the link into your browser. Now the user's email should be verified and ready to go.

* To create an **superuser account**, use this command::

    $ python manage.py createsuperuser

For convenience, you can keep your normal user logged in on Chrome and your superuser logged in on Firefox (or similar), so that you can see how the site behaves for both kinds of users.

Type checks
^^^^^^^^^^^

Running type checks with mypy:

::

  $ mypy caproverdj

Test coverage
^^^^^^^^^^^^^

To run the tests, check your test coverage, and generate an HTML coverage report::

    $ coverage run -m pytest
    $ coverage html
    $ open htmlcov/index.html

Running tests with py.test
~~~~~~~~~~~~~~~~~~~~~~~~~~

::

  $ pytest

Live reloading and Sass CSS compilation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Moved to `Live reloading and SASS compilation`_.

.. _`Live reloading and SASS compilation`: http://cookiecutter-django.readthedocs.io/en/latest/live-reloading-and-sass-compilation.html





Deployment
----------

The following details how to deploy this application.

Setup
^^^^^

During the setup we will refer to the django app as `demo-django`, the redis app as `demo-redis`
and the prostgre app as `demo-db`.You may change this names to your liking

1) Assumptions
^^^^^^^^^^^^^^

The following assumptions are made about your environment:
- You have a working CapRover
- You have read and understood the basic CapRover documentation
- You have ssh access to you CapRover server
- You have configure a gmail app

2) CapRover
^^^^^^^^^^^

- Create a postgres app from the one-click wizard
- Choose `demo` for the name as this will automatically be prefixed with `-db`
- Note username, database and password
- same process for the redis app but only fill the name form

- Create a new blank app with the name `demo-django`
- Fill the environment variables below and enter them with the bulk edit mode::

    DEBUG=False
    DJANGO_SECRET_KEY=YOUR_KEY
    DJANGO_ALLOWED_HOSTS=demo-django.YOUR_CAPROVER_DOMAIN,CUSTOM_DOMAIN
    DATABASE_URL=postgres://${POSTGRES_USER}:${POSTGRES_PASSWORD}@${POSTGRES_HOST}:${POSTGRES_PORT}/${POSTGRES_DB}
    REDIS_URL=YOUR_REDIS_APP_URL
    EMAIL_HOST_USER=YOUR_GMAIL_APP_USER
    EMAIL_HOST_PASSWORD=YOUR_GMAIL_APP_PASSWORD


3) Django
^^^^^^^^^
- Deploy the code from this repository with your method of choice to `demo-django`
- Open a ssh session to `demo-django` by typping : docker exec -it $(docker ps --filter name=your_demo_app_name -q) /bin/sh
- Create a superuser by executing `python manage.py createsuperuser`

Source
^^^^^^
This caprover setup is based on:
https://gitlab.com/kamneros/caprover-django




