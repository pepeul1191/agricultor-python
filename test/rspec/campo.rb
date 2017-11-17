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

listar