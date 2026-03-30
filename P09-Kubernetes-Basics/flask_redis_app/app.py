from flask import Flask
import redis
import os
import socket

app = Flask(__name__)
redis_client = redis.Redis(host='redis', port=6379, decode_responses=True)

@app.route('/')
def hello():
    count = redis_client.incr('hits')
    pod_name = os.environ.get('HOSTNAME', socket.gethostname())
    return f'Hello World! v2 - I have been seen {count} times. My name is: {pod_name}\n'

@app.route('/metrics')
def metrics():
    count = redis_client.get('hits') or 0
    return f'# HELP view_count Flask-Redis-App visit counter\n# TYPE view_count counter\nview_count{{service="Flask-Redis-App"}} {count}\n'

@app.route('/health')
def health():
    return 'OK', 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
