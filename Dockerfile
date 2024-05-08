FROM python:3.6-slim

# so that  Python won't write .pyc files to disk.
ENV PYTHONDONTWRITEBYTECODE 1
# to see the output of your application immediately in the Docker logs
ENV PYTHONUNBUFFERED 1

WORKDIR /app
COPY . /app
RUN pip install -r requirements.txt
RUN python3.6 manage.py makemigrations
RUN python3.6 manage.py migrate

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
