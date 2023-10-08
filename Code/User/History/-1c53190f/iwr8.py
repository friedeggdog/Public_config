from flask import request, Flask
import json
app1 = Flask(__name__)
@app1.route('/mess1', methods=['GET', 'POST'])
def hello_world():
    
    return 'mess1:'+str(request.headers.get("X-Request-Id"))
if __name__ == '__main__':
    app1.run(debug=True, host='0.0.0.0')