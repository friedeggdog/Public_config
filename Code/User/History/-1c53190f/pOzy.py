from flask import request, Flask
import subprocess
app1 = Flask(__name__)
@app1.route('/', subdomain="first", methods=['GET', 'POST'])
def home():
    id = subprocess.check_output(['bash','-c', 'echo $HOSTNAME']) 
    return 'mess1:) '+id.decode()

if __name__ == '__main__':
    app1.config['SERVER_NAME'] = "mess.local"
    app1.run(debug=True, host='0.0.0.0')