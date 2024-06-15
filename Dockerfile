FROM python:3.10
WORKDIR  /app
COPY pyproject.toml app.py tests.py /app/
RUN pip3 install poetry
RUN poetry config virtualenvs.create false
RUN poetry install
EXPOSE 8080
ENTRYPOINT ["poetry", "run" ]
CMD ["gunicorn", "-b", "0.0.0.0:8080", "app:app"]
