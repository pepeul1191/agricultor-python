#!/usr/bin/env python
# -*- coding: utf-8 -*-
# views/campo.py
import json
from flask import Blueprint, request
from sqlalchemy.sql import select
from configs.models import Campo
from configs.database import engine, session_db

campo = Blueprint('campo', __name__)

@campo.route('/campo/listar/<int:asociacion_id>', methods=['GET'])
def listar(asociacion_id):
	conn = engine.connect()
	stmt = """
        SELECT C.id, C.nombre, C.area, C.distrito_id, C.asociacion_id, A.nombre AS asociacion 
				FROM campos C INNER JOIN asociaciones A
				ON C.asociacion_id = A.id
				WHERE C.asociacion_id = %d 
        """ % asociacion_id
	return json.dumps([dict(r) for r in conn.execute(stmt)])