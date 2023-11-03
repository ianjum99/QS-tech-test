from flask import Flask, render_template, request
import requests

app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def index():
    weather_data = None
    if request.method == 'POST':
        city = request.form['city']
        response = requests.get(f'http://api.openweathermap.org/data/2.5/weather?q={city}&appid=YOUR_API_KEY_HERE')
        if response.status_code == 200:
            weather_data = response.json()
    return render_template('index.html', weather_data=weather_data)

if __name__ == '__main__':
    app.run(debug=True)

