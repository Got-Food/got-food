FROM python:3.12-slim
WORKDIR /app
COPY docker_requirements.txt .
RUN pip install --no-cache-dir -r docker_requirements.txt
COPY . .
EXPOSE 5000
CMD ["gunicorn", "app:app"]
