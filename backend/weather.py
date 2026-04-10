import requests

API_KEY = "weather_api_key"

def get_weather(city):
    url = f"https://api.openweathermap.org/data/2.5/weather?q={city}&appid={API_KEY}&units=metric"

    response = requests.get(url)
    data = response.json()

    # 🔍 DEBUG PRINT (optional)
    print(f"{city} -> {data}")

    # 🚨 SAFE CHECK
    if "main" not in data:
        return {
            "temp": 30,
            "humidity": 60,
            "rainfall": 50
        }

    return {
        "temp": data["main"]["temp"],
        "humidity": data["main"]["humidity"],
        "rainfall": data.get("rain", {}).get("1h", 0)
    }
