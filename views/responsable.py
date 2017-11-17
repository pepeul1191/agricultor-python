#!/usr/bin/env python
# -*- coding: utf-8 -*-
# views/responsable.py
import json
from flask import Blueprint, request
from sqlalchemy.sql import select
from configs.models import Responsable
from configs.database import engine, session_db

responsable = Blueprint('responsable', __name__)

@responsable.route('/responsable/listar', methods=['GET'])
def listar():
	conn = engine.connect()
	stmt = select([Responsable])
	return json.dumps([dict(r) for r in conn.execute(stmt)])

@responsable.route('/responsable/guardar', methods=['POST'])
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
				nombres = nuevo['nombres']
				paterno = nuevo['paterno']
				materno = nuevo['materno']
				correo = nuevo['correo']
				telefono = nuevo['telefono']
				s = Responsable(nombres = nombres, paterno = paterno, materno = materno, correo = correo, telefono = telefono)
				session.add(s)
				session.flush()
				temp = {'temporal' : temp_id, 'nuevo_id' : s.id}
				array_nuevos.append(temp)
		if len(editados) != 0:
			for editado in editados:
				session.query(Responsable).filter_by(id = editado['id']).update(editado)
		if len(eliminados) != 0:
			for id in eliminados:
				session.query(Responsable).filter_by(id = id).delete()
		session.commit()
		rpta = {'tipo_mensaje' : 'success', 'mensaje' : ['Se ha registrado los cambios en los reponsables', array_nuevos]}
	except Exception as e:
		session.rollback()
		rpta = {'tipo_mensaje' : 'error', 'mensaje' : ['Se ha producido un error en guardar la tabla de responsables', str(e)]}
	return json.dumps(rpta)