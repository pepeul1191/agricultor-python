require 'sequel'

Sequel.migration do
  up do
    Sequel.connect('sqlite://db/db_agricultor.db')
    DB.transaction do
      file = File.new('db/data/campos.txt', 'r')
      while (line = file.gets)
        line_array = line.split('::')
        nombre = line_array[0]
        area = line_array[1]
        asociacion_id = line_array[2]
        distrito_id = line_array[3].strip
        #puts id + " - " + nombre
        DB[:campos].insert(nombre: nombre, area: area, asociacion_id: asociacion_id, distrito_id: distrito_id, imagen_id: 'campo')
      end
    end
  end

  down do
    DB = Sequel.connect('sqlite://db/db_agricultor.db')
    DB[:campos].delete
  end
end