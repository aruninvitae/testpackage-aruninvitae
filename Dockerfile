FROM python:3-slim

WORKDIR /testpackage-aruninvitae

RUN pip install poetry
RUN poetry config virtualenvs.create false

COPY README.md ./
COPY poetry.toml ./
COPY poetry.lock ./
COPY pyproject.toml ./

RUN poetry install --no-root -vvv

COPY testpackage ./testpackage
COPY tests ./tests

RUN poetry install -vvv

CMD bash

