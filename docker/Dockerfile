FROM tiangolo/uvicorn-gunicorn-fastapi:python3.11

# requirementsのinstall
#COPY requirements.txt ./
#RUN --mount=type=cache,target=/root/.cache/pip \
#    pip install -r requirements.txt
WORKDIR /app
COPY ../src /app
