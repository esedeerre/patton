FROM python:3.6

WORKDIR "/usr/src/app"

RUN pip --no-cache-dir install pipenv

COPY Pipfile .

COPY Pipfile.lock .

RUN pipenv install --system --deploy

COPY patton patton
COPY main.py .
COPY load_assets.sh .

CMD ["python", "main.py"]
