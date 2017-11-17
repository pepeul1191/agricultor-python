Sequel.migration do
	up do
    DB.run('
    	CREATE VIEW vw_nombre_completo_responsable
			AS
			SELECT id, (paterno|| " " || materno|| ", " ||  nombres) AS responsable FROM responsables
    ')
	end

	down do
		drop_table(:vw_nombre_completo_responsable)
	end
end