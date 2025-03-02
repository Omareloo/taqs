from flask import Flask, request, jsonify
import pickle
import numpy as np

app = Flask(__name__)

# Load the model
file_path = "random_forest_model.pkl"

try:
    with open(file_path, 'rb') as file:
        model = pickle.load(file)
except FileNotFoundError:
    print(f"File '{file_path}' not found.")

except Exception as e:
    print(f"An error occurred: {e}")


# Define a route for the home page
@app.route('/')
def home():
    return "Welcome to the ML Prediction API!"


# Define the prediction route
@app.route('/predict', methods=['POST'])
def predict():

    try:

        data = request.json  # Get the JSON data from the request
        if data is None or 'features' not in data:
            return jsonify({'error': 'Invalid request data'}), 400

        features = data['features']  # Extract the features

    # Convert to 2D array (since the model expects 2D input)
        features = np.array(features).reshape(1, -1)

    # Make the prediction
        prediction = model.predict(features)

    # Return the prediction as JSON
        return jsonify({'prediction': prediction.tolist()})
    except Exception as ee:
        print(f"An error occurred: {ee}")
        return jsonify({'error': str(ee)}), 500


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001)
