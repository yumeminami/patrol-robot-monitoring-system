FROM python:3.10

WORKDIR /

COPY . /app

RUN pip install -r app/requirements.txt

EXPOSE 8000

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]