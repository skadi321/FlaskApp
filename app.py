from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/api/greeting', methods=['GET'])
def get_welcome():
    return jsonify({"message": "Welcome to the Simple Python API!"})

@app.route('/api/greeting/<name>', methods=['GET'])
def greet_user(name):
    greeting = f"Hello, {name}! Welcome to the world of Python APIs."
    return jsonify({"greeting": greeting})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
