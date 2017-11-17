require 'sequel'

Sequel.migration do
  up do
  	Sequel.connect('sqlite://db/db_agricultor.db')
		DB.transaction do
	  	file = File.new('db/data/asociaciones.txt', 'r')
			while (line = file.gets)
				line_array = line.split('::')
				nombre = line_array[0]
				area = line_array[1]
				referencia_llegada = line_array[2]
				responsable_id = line_array[3].strip
				#puts id + " - " + nombre
				DB[:asociaciones].insert(nombre: nombre, area: area, referencia_llegada: referencia_llegada, responsable_id: responsable_id)
			end
		end
  end

	down do
		DB = Sequel.connect('sqlite://db/db_agricultor.db')
		DB[:asociaciones].delete
	end
end