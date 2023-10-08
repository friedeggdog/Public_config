from flask import request, Flask
import json
app1 = Flask(__name__)
@app1.route('/mess3', methods=['GET', 'POST'], subdomain='third')
def hello_world():
    return 'mess3:) '
if __name__ == '__main__':
    website_url = 'mess.local'
    app1.config['SERVER_NAME'] = website_url
    app1.run(debug=True, host='0.0.0.0')