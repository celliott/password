#!/usr/bin/env python

import os
import json
import random
import requests
import logging
from flask import Flask, jsonify, request, Response
from functools import wraps

logging.basicConfig(level=logging.INFO, format='%(asctime)s %(levelname)s: %(message)s')
logger = logging.getLogger(__name__)

block_size = os.getenv('BLOCK_SIZE', 4)
blocks = os.getenv('BLOCKS', 4)
port = os.getenv('PORT', 3000)
debug = os.getenv('DEBUG', False)
vault_addr = os.getenv('VAULT_ADDR', 'http://127.0.0.1:8200')

app = Flask(__name__)
chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

def check_auth(username, password):
  headers = {'content-type': 'application/json'}
  url = "{0}/v1/auth/userpass/login/{1}".format(vault_addr, username)
  data = { "password": password }
  r = requests.post(url, headers=headers, data=json.dumps(data))
  response = json.loads(r.text)
  try:
    if response['auth']['client_token']:
      return True
  except:
    pass

def authenticate():
  return Response(
  'Login Required', 401,
  {'WWW-Authenticate': 'Basic realm="Login Required"'})

def auth(f):
  @wraps(f)
  def decorated(*args, **kwargs):
    auth = request.authorization
    if not auth or not check_auth(auth.username, auth.password):
      return authenticate()
    return f(*args, **kwargs)
  return decorated

def get_block():
  block=''
  for i in range(block_size):
    next_index = random.randrange(len(chars))
    block = block + chars[next_index]
  return block

def get_password():
  password=[]
  for i in range(blocks):
    password.append(get_block())
  return '-'.join(password)

@app.route('/healthz', methods=['GET'])
def healthz():
  return json.dumps({'status':'ok'}), 200, {'ContentType':'application/json'}

@app.route('/', methods=['GET'])
#@auth
def index():
  return get_password()

@app.route('/json', methods=['GET'])
#@auth
def get_json():
  return jsonify(
    password=get_password()
  )

if __name__ == "__main__":
  app.run(host='0.0.0.0', port=port, debug=debug)
