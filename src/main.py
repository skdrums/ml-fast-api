from fastapi import FastAPI
from pydantic import BaseModel
# from infer.detection.exec import text

app = FastAPI()

class Item(BaseModel):
    name: str
    price: float
    is_offer: bool = None

@app.get("/")
def read_root():
#     tex = text()
    return {"Hello": "hoge"}

@app.get("/items/{item_id}")
def read_item(item_id: int, q: str = None):
    return {"item_id": item_id, "q": q}

# @app.post("/items")

@app.put("/items/{item_id}")
def put_item(item_id: int, item: Item):
    return {"item_name": item.name, "item_id": item_id}
