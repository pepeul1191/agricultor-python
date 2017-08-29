#!/usr/bin/env python
# -*- coding: utf-8 -*-
# app.py
import os
from flask import Flask, request, render_template
from flask.ext.cors import CORS, cross_origin
from configs.helper import Helper
from views.home import home
from views.departamento import departamento
from views.distrito import distrito
from views.provincia import provincia

app = Flask(__name__)
app.register_blueprint(home)
app.register_blueprint(departamento)
app.register_blueprint(provincia)
app.register_blueprint(distrito)
cors = CORS(app)
app.config['CORS_HEADERS'] = 'Content-Type'

@app.errorhandler(404)
def not_found(e):
    return render_template('error/404.html', helper = Helper()), 404

@app.errorhandler(500)
def server_error(e):
    return render_template('error/500.html'), 500
'''
@app.route('/')
def index():
	return 'Error : URI vacía'
'''
@app.after_request
def apply_caching(response):
    response.headers['Server'] = 'Python; Ubuntu; Flask; Werkzeug;'
    return response

if __name__ == '__main__':
	app.run(debug=True, host='0.0.0.0', port=5000)