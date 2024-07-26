import numpy as np
from flask import Flask, request, jsonify
from keras.models import load_model
import cv2

app = Flask(__name__)

# Load the model and labels
model = load_model('C:/Users/Ranjith/Documents/sih project/API/model.h5')
with open('C:/Users/Ranjith/Documents/sih project/API/labels.txt', 'r') as file:
    labels = file.read().splitlines()


def prepare_image(image_path):
    IMG_SIZE = 64
    img_array = cv2.imread(image_path, cv2.IMREAD_COLOR)
    new_array = cv2.resize(img_array, (IMG_SIZE, IMG_SIZE))
    return new_array.reshape(-1, IMG_SIZE, IMG_SIZE, 3)

# Define a route to receive images and make predictions
@app.route('/', methods=['POST'])
def predict():
    print("i am here")
    if request.method == 'POST':
        if 'file' not in request.files:
            return jsonify({'error': 'No file part'})
        file = request.files['file']
        image_path = 'temp_image.jpg'
        file.save(image_path)
        image_array = prepare_image(image_path)
        result = model.predict(image_array)
        predicted_class = labels[np.argmax(result)]
        return jsonify({'result': predicted_class}), 200


if __name__ == '__main__':
    print("hello")
    app.run(debug=True, port=4000)
