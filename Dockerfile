FROM python:3.10

WORKDIR /

COPY . /app

RUN pip install -r app/requirements.txt

EXPOSE 8000

ENV PYTHONPATH=$PWD

CMD ["python3", "app/main.py"]