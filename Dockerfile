FROM python:3

WORKDIR /opt/app/
COPY . /opt/app/

ENTRYPOINT ["python", "./server.py"]

