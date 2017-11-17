#!/usr/bin/env python
# -*- coding: utf-8 -*-
# views/asociacion.py
import json
from flask import Blueprint, request
from sqlalchemy.sql import select
from configs.models import Asociacion
from configs.database import engine, session_db

asociacion = Blueprint('asociacion', __name__)

@asociacion.route('/asociacion/listar', methods=['GET'])
def listar():
	conn = engine.connect()
	stmt = """
        SELECT A.id, A.nombre, A.referencia_llegada, A.area, A.responsable_id, (R.paterno|| " " || R.materno|| ", " ||  R.nombre) AS responsable
				FROM asociaciones A INNER JOIN responsables R
				ON A.responsable_id = R.id
        """
	return json.dumps([dict(r) for r in conn.execute(stmt)])

#{"nuevos":[],"editados":[{"id":"200","nombre":"Lunder","referencia_llegada":"Usnea strigosa (Ach.) Eaton ssp. major (Michx.) I. Tav.","area":"27.25","responsable_id":"2"}],"eliminados":[]}
@asociacion.route('/asociacion/guardar', methods=['POST'])
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
				referencia_llegada = nuevo['referencia_llegada']
				area = nuevo['area']
				responsable_id = nuevo['responsable_id']
				s = Asociacion(nombre = nombre, referencia_llegada = referencia_llegada, area = area, responsable_id = responsable_id)
				session.add(s)
				session.flush()
				temp = {'temporal' : temp_id, 'nuevo_id' : s.id}
				array_nuevos.append(temp)
		if len(editados) != 0:
			for editado in editados:
				session.query(Asociacion).filter_by(id = editado['id']).update(editado)
		if len(eliminados) != 0:
			for id in eliminados:
				session.query(Asociacion).filter_by(id = id).delete()
		session.commit()
		rpta = {'tipo_mensaje' : 'success', 'mensaje' : ['Se ha registrado los cambios en los asociaciones', array_nuevos]}
	except Exception as e:
		session.rollback()
		rpta = {'tipo_mensaje' : 'error', 'mensaje' : ['Se ha producido un error en guardar la tabla de asociaciones', str(e)]}
	return json.dumps(rpta)