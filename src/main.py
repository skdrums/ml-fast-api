from fastapi import FastAPI
# from infer.detection.exec import text

app = FastAPI()

@app.get("/")
def read_root():
#     tex = text()
    return {"Hello": "hoge"}

@app.get("/items/{item_id}")
def read_item(item_id: int, q: str = None):
    return {"item_id": item_id, "q": q}

