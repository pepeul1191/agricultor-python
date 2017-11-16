require 'sequel'

Sequel.migration do
  up do
  	Sequel.connect('sqlite://db/db_agricultor.db')
		DB.transaction do
	  	file = File.new('db/data/responsables.txt', 'r')
			while (line = file.gets)
				line_array = line.split('::')
				nombres = line_array[0]
				paterno = line_array[1]
				materno = line_array[2]
				telefono = line_array[3]
				email = line_array[4].strip
				#puts id + " - " + nombre
				DB[:responsables].insert(nombres: nombres, paterno: paterno, materno: materno, telefono: telefono, email: email)
			end
		end
  end

	down do
		DB = Sequel.connect('sqlite://db/db_agricultor.db')
		DB[:responsables].delete
	end
end