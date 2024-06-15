FROM python:3.10
WORKDIR  /app
COPY pyproject.toml /app/
RUN pip3 install poetry
RUN poetry config virtualenvs.create false
RUN poetry install
COPY /src /app/src
EXPOSE 80
ENTRYPOINT ["poetry", "run", "python" ]
CMD [ "src/app.py" ]
