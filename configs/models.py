# -*- coding: utf-8 -*-
from sqlalchemy import Table, Column, Integer, String, ForeignKey, Float
from configs.database import Base
# http://docs.sqlalchemy.org/en/latest/orm/basic_relationships.html
class Responsable(Base):
	__tablename__ = 'responsables'
	id = Column(Integer, primary_key=True)
	nombres = Column(String)
	paterno = Column(String)
	materno = Column(String)
	telefono = Column(String)
	correo = Column(String)

class Asociacion(Base):
	__tablename__ = 'asociaciones'
	id = Column(Integer, primary_key=True)
	nombre = Column(String)
	area = Column(Float)
	referencia_llegada = Column(String)
	responsable_id = Column(Integer, ForeignKey('responsables.id'))

class Campo(Base):
	__tablename__ = 'campos'
	id = Column(Integer, primary_key=True)
	nombre = Column(String)
	area = Column(Float)
	distrito_id = Column(Integer)
	asociacion_id = Column(Integer)
	imagen_id = Column(String)

class VWNombreCompletoResponsable(Base):
	__tablename__ = 'vw_nombre_completo_responsable'
	id = Column(Integer, primary_key=True)
	responsable = Column(String)