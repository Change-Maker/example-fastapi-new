FROM python:3.10.7-slim

COPY ["./requirements.txt", "/ws/"]
COPY ["./src/fastapi_app/", "/ws/src/fastapi_app/"]
COPY ["./src/client/build/", "/ws/src/client/build/"]

WORKDIR "/ws"
RUN [\
  "python", "-m", "pip", "install", \
  "--no-cache-dir", "--upgrade", "-r", "requirements.txt"\
]

EXPOSE 3001
WORKDIR "/ws/src/fastapi_app"
CMD ["python", "main.py"]
