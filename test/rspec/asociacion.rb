# encoding: utf-8

require_relative 'app'
require 'json'

def listar
  RSpec.describe App do
    describe "1. Listar asociaciones: " do
      it '1.1 Conexión con backend' do
        url = 'test/conexion'
        test = App.new(url)
        test.get()
        expect(test.response.code).to eq(200)
      end
      it '1.2 Listar los asociaciones registrados' do
        url = 'asociacion/listar'
        test = App.new(url)
        test.get()
        expect(test.response.code).to eq(200)
      end
    end
  end
end

def crear
  RSpec.describe App do
    describe "2. Crear asociaciones: " do
      it '2.1 Conexión con backend' do
        url = 'test/conexion'
        test = App.new(url)
        test.get()
        expect(test.response.code).to eq(200)
      end
      it '2.2 Crear asociaciones' do
        data = {
          :nuevos => [
            {
              :id => 'tablaAsociacion_482',
              :nombre => 'Corbett', 
              :referencia_llegada => 'Dudmarsh', 
              :area => 21, 
              :responsable_id => 2,
            },
            {
              :id => 'tablaAsociacion_483',
              :nombre => 'Channa', 
              :referencia_llegada => 'Labarre', 
              :area => 21, 
              :responsable_id => 2,
            },
            {
              :id => 'tablaAsociacion_484',
              :nombre => 'Maxy', 
              :referencia_llegada => 'McGlone', 
              :area => 21, 
              :responsable_id => 2,
            },
            {
              :id => 'tablaAsociacion_485',
              :nombre => 'Alphard', 
              :referencia_llegada => 'Biddlecombe', 
              :area => 21, 
              :responsable_id => 2,
            }  
          ],
          :editados => [],  
          :eliminados => []
        }.to_json
        url = 'asociacion/guardar?data=' + data
        test = App.new(url)
        test.post()
        expect(test.response.code).to eq(200)
        expect(test.response.body).not_to include('error')
        expect(test.response.body).to include('Se ha registrado los cambios en los asociaciones')
        expect(test.response.body).to include('nuevo_id')
        expect(test.response.body).to include('success')
      end
    end
  end
end

def editar
  RSpec.describe App do
    describe "3. Editar asociaciones: " do
      it '3.1 Conexión con backend' do
        url = 'test/conexion'
        test = App.new(url)
        test.get()
        expect(test.response.code).to eq(200)
      end
      it '3.2 Editar asociaciones' do
        data = {
          :nuevos => [
          ],
          :editados => [
            {
              :id => '1',
              :nombre => 'XD', 
              :referencia_llegada => 'Dudmarsh', 
              :area => 21, 
              :responsable_id => 2,
            },
            {
              :id => '2',
              :nombre => 'XD', 
              :referencia_llegada => 'Labarre', 
              :area => 21, 
              :responsable_id => 2,
            },
            {
              :id => '3',
              :nombre => 'XD', 
              :referencia_llegada => 'McGlone', 
              :area => 21, 
              :responsable_id => 2,
            },
            {
              :id => '4',
              :nombre => 'XD', 
              :referencia_llegada => 'Biddlecombe', 
              :area => 21, 
              :responsable_id => 2,
            }
          ],  
          :eliminados => []
        }.to_json
        url = 'asociacion/guardar?data=' + data
        test = App.new(url)
        test.post()
        expect(test.response.code).to eq(200)
        expect(test.response.body).not_to include('error')
        expect(test.response.body).to include('Se ha registrado los cambios en los asociaciones')
        expect(test.response.body).to include('success')
      end
    end
  end
end

def eliminar
  RSpec.describe App do
    describe "4. Eliminar asociaciones: " do
      it '4.1 Conexión con backend' do
        url = 'test/conexion'
        test = App.new(url)
        test.get()
        expect(test.response.code).to eq(200)
      end
      it '4.2 Eliminar asociaciones' do
        data = {
          :nuevos => [
          ],
          :editados => [
          ],  
          :eliminados => [
            5,6,7
          ]
        }.to_json
        url = 'asociacion/guardar?data=' + data
        test = App.new(url)
        test.post()
        expect(test.response.code).to eq(200)
        expect(test.response.body).not_to include('error')
        expect(test.response.body).to include('Se ha registrado los cambios en los asociaciones')
        expect(test.response.body).to include('success')
      end
    end
  end
end

#listar
#crear
#editar
eliminar