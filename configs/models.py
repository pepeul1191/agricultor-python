# -*- coding: utf-8 -*-
from sqlalchemy import Table, Column, Integer, String, ForeignKey, Double
from configs.database import Base
# http://docs.sqlalchemy.org/en/latest/orm/basic_relationships.html
class Responsable(Base):
	__tablename__ = 'responsables'
	id = Column(Integer, primary_key=True)
	nombres = Column(String)
	paterno = Column(String)
	materno = Column(String)
	telefono = Column(String)
	email = Column(String)

class Asociacion(Base):
	__tablename__ = 'asociaciones'
	id = Column(Integer, primary_key=True)
	nombre = Column(String)
	area = Column(Double)
	referencia_llegada = Column(String)
	responsable_id = Column(Integer, ForeignKey('responsable.id'))

class Campo(Base):
	__tablename__ = 'campos'
	id = Column(Integer, primary_key=True)
	nombre = Column(String)
	area = Column(Double)
	distrito_id = Column(Integer)