# encoding: utf-8

require_relative 'app'
require 'json'

def listar
  RSpec.describe App do
    describe "1. Listar responsables: " do
      it '1.1 Conexión con backend' do
        url = 'test/conexion'
        test = App.new(url)
        test.get()
        expect(test.response.code).to eq(200)
      end
      it '1.2 Listar los responsables registrados' do
        url = 'responsable/listar'
        test = App.new(url)
        test.get()
        expect(test.response.code).to eq(200)
      end
    end
  end
end

def crear
  RSpec.describe App do
    describe "2. Crear responsables: " do
      it '2.1 Conexión con backend' do
        url = 'test/conexion'
        test = App.new(url)
        test.get()
        expect(test.response.code).to eq(200)
      end
      it '2.2 Crear responsables' do
        data = {
          :nuevos => [
            {
              :id => 'tablaResponsable_482',
              :nombres => 'Corbett', 
              :paterno => 'Dudmarsh', 
              :materno => 'Colson', 
              :correo => 'ccolson0@squidoo.com', 
              :telefono => '235-446-6231'},
            {
              :id => 'tablaResponsable_483',
              :nombres => 'Channa', 
              :paterno => 'Labarre', 
              :materno => 'Asgodby', 
              :correo => 'casgodby1@tmall.com', 
              :telefono => '903-282-9401'},
            {
              :id => 'tablaResponsable_484',
              :nombres => 'Maxy', 
              :paterno => 'McGlone', 
              :materno => 'Drakeley', 
              :correo => 'mdrakeley2@squidoo.com', 
              :telefono => '235-446-4376'},
            {
              :id => 'tablaResponsable_485',
              :nombres => 'Alphard', 
              :paterno => 'Biddlecombe', 
              :materno => 'Middas', 
              :correo => 'amiddas3@squidoo.com', 
              :telefono => '235-446-7602'}  
          ],
          :editados => [],  
          :eliminados => []
        }.to_json
        url = 'responsable/guardar?data=' + data
        test = App.new(url)
        test.post()
        expect(test.response.code).to eq(200)
        expect(test.response.body).not_to include('error')
        expect(test.response.body).to include('Se ha registrado los cambios en los reponsables')
        expect(test.response.body).to include('nuevo_id')
        expect(test.response.body).to include('success')
      end
    end
  end
end

def editar
  RSpec.describe App do
    describe "3. Editar responsables: " do
      it '3.1 Conexión con backend' do
        url = 'test/conexion'
        test = App.new(url)
        test.get()
        expect(test.response.code).to eq(200)
      end
      it '3.2 Editar responsables' do
        data = {
          :nuevos => [
          ],
          :editados => [
            {
              :id => '1',
              :nombres => 'XD', 
              :paterno => 'Dudmarsh', 
              :materno => 'Colson', 
              :correo => 'ccolson0@squidoo.com', 
              :telefono => '235-446-6231'},
            {
              :id => '2',
              :nombres => 'XD', 
              :paterno => 'Labarre', 
              :materno => 'Asgodby', 
              :correo => 'casgodby1@tmall.com', 
              :telefono => '903-282-9401'},
            {
              :id => '3',
              :nombres => 'XD', 
              :paterno => 'McGlone', 
              :materno => 'Drakeley', 
              :correo => 'mdrakeley2@squidoo.com', 
              :telefono => '235-446-4376'},
            {
              :id => '4',
              :nombres => 'XD', 
              :paterno => 'Biddlecombe', 
              :materno => 'Middas', 
              :correo => 'amiddas3@squidoo.com', 
              :telefono => '235-446-7602'}
          ],  
          :eliminados => []
        }.to_json
        url = 'responsable/guardar?data=' + data
        test = App.new(url)
        test.post()
        expect(test.response.code).to eq(200)
        expect(test.response.body).not_to include('error')
        expect(test.response.body).to include('Se ha registrado los cambios en los reponsables')
        expect(test.response.body).to include('success')
      end
    end
  end
end

def eliminar
  RSpec.describe App do
    describe "3. Eliminar responsables: " do
      it '3.1 Conexión con backend' do
        url = 'test/conexion'
        test = App.new(url)
        test.get()
        expect(test.response.code).to eq(200)
      end
      it '3.2 Eliminar responsables' do
        data = {
          :nuevos => [
          ],
          :editados => [
          ],  
          :eliminados => [
            5,6,7
          ]
        }.to_json
        url = 'responsable/guardar?data=' + data
        test = App.new(url)
        test.post()
        expect(test.response.code).to eq(200)
        expect(test.response.body).not_to include('error')
        expect(test.response.body).to include('Se ha registrado los cambios en los reponsables')
        expect(test.response.body).to include('success')
      end
    end
  end
end


#listar
#crear
#editar
eliminar