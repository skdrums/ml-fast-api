from fastapi import FastAPI
from pydantic import BaseModel
import logging
from fastapi.middleware.cors import CORSMiddleware
# from infer.detection.exec import text

logging.basicConfig(level=logging.INFO)
_logger = logging.getLogger('sample_logger')
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
    _logger.info('[%s] %s' % (current_datetime(), message))
    return {"message": "sk healthcheck"}