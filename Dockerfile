FROM python:latest
RUN mkdir /doc
COPY . /doc
WORKDIR /doc
RUN pip install --no-cache-dir fastapi jinja2 uvicorn
EXPOSE 8000
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
