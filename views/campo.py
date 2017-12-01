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
        SELECT C.id, C.nombre, C.area, C.distrito_id, C.asociacion_id, C.imagen_id, A.nombre AS asociacion 
				FROM campos C INNER JOIN asociaciones A
				ON C.asociacion_id = A.id
				WHERE C.asociacion_id = %d 
        """ % asociacion_id
	return json.dumps([dict(r) for r in conn.execute(stmt)])

@campo.route('/campo/guardar', methods=['POST'])
def guardar():
	print request.args
	data = json.loads(request.args['data'])
	nuevos = data['nuevos']
	editados = data['editados']
	eliminados = data['eliminados']
	array_nuevos = []
	rpta = None
	session = session_db()
	try:
		if len(nuevos) != 0:
			for nuevo in nuevos:
				temp_id = nuevo['id']
				nombre = nuevo['nombre']
				area = nuevo['area']
				imagen_id = nuevo['imagen_id']
				distrito_id = nuevo['distrito_id']
				asociacion_id = data['extra']['asociacion_id']
				s = Campo(nombre = nombre, area = area, distrito_id = distrito_id, imagen_id = imagen_id, asociacion_id = asociacion_id)
				session.add(s)
				session.flush()
				temp = {'temporal' : temp_id, 'nuevo_id' : s.id}
				array_nuevos.append(temp)
		if len(editados) != 0:
			for editado in editados:
				session.query(Campo).filter_by(id = editado['id']).update(editado)
		if len(eliminados) != 0:
			for id in eliminados:
				session.query(Campo).filter_by(id = id).delete()
		session.commit()
		rpta = {'tipo_mensaje' : 'success', 'mensaje' : ['Se ha registrado los cambios en los campos de la asociación', array_nuevos]}
	except Exception as e:
		session.rollback()
		rpta = {'tipo_mensaje' : 'error', 'mensaje' : ['Se ha producido un error en guardar la tabla de campos', str(e)]}
	return json.dumps(rpta)