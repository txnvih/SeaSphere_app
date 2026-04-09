from fastapi import FastAPI
from weather import get_weather
from model import predict_flood

app = FastAPI()

# your cities (match Flutter cities.dart)
cities = [
    {"name": "New Delhi", "lat": 28.6139, "lng": 77.2090},
    {"name": "Mumbai", "lat": 19.0760, "lng": 72.8777},
    {"name": "Kolkata", "lat": 22.5726, "lng": 88.3639},
    {"name": "Chennai", "lat": 13.0827, "lng": 80.2707},
    {"name": "Bengaluru", "lat": 12.9716, "lng": 77.5946},
    {"name": "Hyderabad", "lat": 17.3850, "lng": 78.4867},
    {"name": "Jaipur", "lat": 26.9124, "lng": 75.7873},
    {"name": "Varanasi", "lat": 25.3176, "lng": 82.9739},
    {"name": "Kanpur", "lat": 26.4499, "lng": 80.3319},
    {"name": "Pune", "lat": 18.5204, "lng": 73.8567},
    {"name": "Surat", "lat": 21.1702, "lng": 72.8311},
    {"name": "Indore", "lat": 22.7196, "lng": 75.8577},
]

@app.get("/all-cities-risk")
def all_cities():
    result = []

    for c in cities:
        try:
            weather = get_weather(c["name"])

            rainfall = weather.get("rainfall", 50)
            humidity = weather.get("humidity", 60)
            temp = weather.get("temp", 30)

            risk = predict_flood(rainfall, humidity, temp)

        except Exception as e:
            print(f"Error in {c['name']}: {e}")
            risk = 0.5  # fallback

        result.append({
            "city": c["name"],
            "risk": float(risk),
            "lat": c["lat"],
            "lng": c["lng"]
        })

    return result