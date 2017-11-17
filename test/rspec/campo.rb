# encoding: utf-8

require_relative 'app'
require 'json'

def listar
  RSpec.describe App do
    describe "1. Listar campos: " do
      it '1.1 Conexión con backend' do
        url = 'test/conexion'
        test = App.new(url)
        test.get()
        expect(test.response.code).to eq(200)
      end
      it '1.2 Listar los campos registrados' do
        url = 'campo/listar/5'
        test = App.new(url)
        test.get()
        expect(test.response.code).to eq(200)
      end
    end
  end
end

def crear
  RSpec.describe App do
    describe "2. Crear campos: " do
      it '2.1 Conexión con backend' do
        url = 'test/conexion'
        test = App.new(url)
        test.get()
        expect(test.response.code).to eq(200)
      end
      it '2.2 Crear campos' do
        data = {
          :nuevos => [
            {
              :id => 'tablaCampo_482',
              :nombre => 'Corbett', 
              :area => 12.2, 
              :distrito_id => 928, 
              :asociacion_id => 3, 
            },
            {
              :id => 'tablaCampo_483',
              :nombre => 'Channa', 
              :area => 12.3, 
              :distrito_id => 929, 
              :asociacion_id => 3, 
            },
            {
              :id => 'tablaCampo_484',
              :nombre => 'Maxy', 
              :area => 12.4, 
              :distrito_id => 930, 
              :asociacion_id => 3, 
            },
            {
              :id => 'tablaCampo_485',
              :nombre => 'Alphard', 
              :area => 12.5, 
              :distrito_id => 932, 
              :asociacion_id => 3, 
            }
          ],
          :editados => [],  
          :eliminados => []
        }.to_json
        url = 'campo/guardar?data=' + data
        test = App.new(url)
        test.post()
        expect(test.response.code).to eq(200)
        expect(test.response.body).not_to include('error')
        expect(test.response.body).to include('Se ha registrado los cambios en los campos de la asociaci')
        expect(test.response.body).to include('nuevo_id')
        expect(test.response.body).to include('success')
      end
    end
  end
end

def editar
  RSpec.describe App do
    describe "3. Editar campos: " do
      it '3.1 Conexión con backend' do
        url = 'test/conexion'
        test = App.new(url)
        test.get()
        expect(test.response.code).to eq(200)
      end
      it '3.2 Editar campos' do
        data = {
          :nuevos => [
          ],
          :editados => [
            {
              :id => '201',
              :nombre => 'Corbett XD', 
              :area => 20.2, 
              :distrito_id => 922, 
              :asociacion_id => 3, },
            {
              :id => '202',
              :nombre => 'Corbett XD', 
              :area => 20.2, 
              :distrito_id => 923, 
              :asociacion_id => 3, },
            {
              :id => '203',
              :nombre => 'Corbett XD', 
              :area => 20.2, 
              :distrito_id => 924, 
              :asociacion_id => 3, },
            {
              :id => '204',
              :nombre => 'Corbett XD', 
              :area => 20.2, 
              :distrito_id => 925, 
              :asociacion_id => 3, },
          ],  
          :eliminados => []
        }.to_json
        url = 'campo/guardar?data=' + data
        test = App.new(url)
        test.post()
        expect(test.response.code).to eq(200)
        expect(test.response.body).not_to include('error')
        expect(test.response.body).to include('Se ha registrado los cambios en los campos de la asociaci')
        expect(test.response.body).to include('success')
      end
    end
  end
end

def eliminar
  RSpec.describe App do
    describe "3. Eliminar campos: " do
      it '3.1 Conexión con backend' do
        url = 'test/conexion'
        test = App.new(url)
        test.get()
        expect(test.response.code).to eq(200)
      end
      it '3.2 Eliminar campos' do
        data = {
          :nuevos => [
          ],
          :editados => [
          ],  
          :eliminados => [
            201,202,203,204
          ]
        }.to_json
        url = 'campo/guardar?data=' + data
        test = App.new(url)
        test.post()
        expect(test.response.code).to eq(200)
        expect(test.response.body).not_to include('error')
        expect(test.response.body).to include('Se ha registrado los cambios en los campos de la asociaci')
        expect(test.response.body).to include('success')
      end
    end
  end
end


#listar
#crear
#editar
eliminar