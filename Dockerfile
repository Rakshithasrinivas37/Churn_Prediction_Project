FROM python:3.12-slim

WORKDIR /app

# COPY source destination
COPY ["predict.py", "model_C=1.0.bin", "./"]

RUN pip install --upgrade pip
RUN pip install flask scikit-learn numpy gunicorn

# To expose port to host machine
EXPOSE 5000

ENTRYPOINT [ "gunicorn", "--bind=0.0.0.0:5000", "predict:app"]