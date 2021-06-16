FROM python:3-slim

WORKDIR /testpackage-aruninvitae

COPY README.md ./
COPY scripts/publish.sh ./
COPY poetry.toml ./

RUN pip install poetry
RUN poetry config virtualenvs.create false

COPY poetry.lock ./
COPY pyproject.toml ./

RUN poetry install --no-root -vvv

COPY testpackage ./testpackage
COPY tests ./tests

RUN poetry install -vvv

CMD bash

