#!/usr/bin/env python
# -*- coding: utf-8 -*-
# views/asociacion.py
import json
from flask import Blueprint, request
from sqlalchemy.sql import select
from configs.models import Asociacion, VWNombreCompletoResponsable as VW
from configs.database import engine, session_db

asociacion = Blueprint('asociacion', __name__)

@asociacion.route('/asociacion/listar', methods=['GET'])
def listar():
	conn = engine.connect()
	stmt = """
        SELECT A.id, A.nombre, A.referencia_llegada, A.area, A.responsable_id, (R.paterno|| " " || R.materno|| ", " ||  R.nombres) AS responsable
				FROM asociaciones A INNER JOIN responsables R
				ON A.responsable_id = R.id
        """
	return json.dumps([dict(r) for r in conn.execute(stmt)])

@asociacion.route('/asociacion/buscar', methods=['GET'])
def buscar():
	conn = engine.connect()
	stmt = select([VW]).where(VW.responsable.like(request.args.get('responsable') + '%' )).limit(10)
	return json.dumps([dict(r) for r in conn.execute(stmt)])