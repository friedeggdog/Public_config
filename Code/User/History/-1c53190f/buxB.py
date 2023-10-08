from flask import request, Flask
import json
app1 = Flask(__name__)
@app1.route('/mess1', methods=['GET', 'POST'])
def hello_world():
    print(request.headers)
    return 'mess1:) '
if __name__ == '__main__':
    app1.run(debug=True, host='0.0.0.0')