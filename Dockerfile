FROM python:3

COPY ./requirements.txt /src/requirements.txt
RUN pip3 install --no-cache-dir --upgrade -r /src/requirements.txt

COPY . /src

EXPOSE 7788

WORKDIR src

RUN python3 manage.py makemigrations
RUN python3 manage.py migrate

CMD ["python3", "manage.py", "runserver", "--host", "0.0.0.0", "--port", "7788"]