FROM python:3.10

WORKDIR /app

COPY . /app

RUN pip install -r requirements.txt

EXPOSE 8000

ENV PYTHONPATH=$PWD

CMD ["python3", "app/main.py"]