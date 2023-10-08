from flask import request, Flask
import json
app1 = Flask(__name__)
@app1.route('/', subdomain="third", methods=['GET', 'POST'])
def hello_world():
    return 'mess3:) '
if __name__ == '__main__':
    app1.config['SERVER_NAME'] = "mess.local"
    app1.run(debug=True, host='0.0.0.0')