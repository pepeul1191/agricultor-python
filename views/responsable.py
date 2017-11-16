#!/usr/bin/env python
# -*- coding: utf-8 -*-
# views/provincia.py
import json
from flask import Blueprint
from sqlalchemy.sql import select
from configs.models import Responsable
from configs.database import engine

responsable = Blueprint('responsable', __name__)

@responsable.route('/responsable/listar')
def listar():
	conn = engine.connect()
	stmt = select([Responsable])
	return json.dumps([dict(r) for r in conn.execute(stmt)])