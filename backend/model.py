from sklearn.ensemble import RandomForestRegressor

X = [
    [100, 70, 30],
    [200, 80, 28],
    [50, 60, 35],
    [300, 90, 25]
]

y = [0.3, 0.7, 0.1, 0.9]

model = RandomForestRegressor()
model.fit(X, y)

def predict_flood(rain, humidity, temp):
    return model.predict([[rain, humidity, temp]])[0]