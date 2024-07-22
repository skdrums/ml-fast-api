from fastapi import FastAPI
from pydantic import BaseModel
from util.logger import info
from fastapi.middleware.cors import CORSMiddleware
import datetime
import sys
# from infer.detection.exec import text

app = FastAPI()

origins = [
    "http://localhost:3000",
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

class Item(BaseModel):
    name: str
    price: float
    is_offer: bool = None



@app.get("/")
def read_root():
    now = datetime.datetime.now()
    message = "sk root get log"
    return {"Hello": "hogehoge"}

@app.get("/items/{item_id}")
def read_item(item_id: int, q: str = None):
    return {"item_id": item_id, "q": q}

# @app.post("/items")

@app.put("/items/{item_id}")
def put_item(item_id: int, item: Item):
    return {"item_name": item.name, "item_id": item_id}

@app.get("/healthcheck")
def healthcheck():
    message = "sk healthcheck"
    info(message)
    return {"message": "sk healthcheck"}