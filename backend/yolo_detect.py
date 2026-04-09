from ultralytics import YOLO

model = YOLO("yolov8n.pt")

def detect_oil(image_path):
    results = model(image_path)
    return results[0].boxes.data.tolist()