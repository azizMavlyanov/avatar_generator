import os
import base64
import requests
from flask import Flask, render_template, request, Response
import redis
from io import BytesIO

app = Flask(__name__)
cache = redis.Redis(host='redis', port=6379)

@app.route('/')
def get_main_page():
    return render_template('index.html')

@app.route('/monsters/<name>/<size>')
def get_image(name, size):
    image_base64 = cache.get(name)

    if not image_base64:
        response = requests.get('http://monster:8080/monster/' + name + '?size=' + size)
        avatar = response.content
        cache.set(name, base64.b64encode(avatar))
        return Response(avatar, mimetype='image/png')

    image = BytesIO(base64.b64decode(image_base64))

    return Response(image, mimetype='image/png')

if __name__ == '__main__':
    # Threaded option to enable multiple instances for multiple user access support
    app.run(host="0.0.0.0", port=9090)