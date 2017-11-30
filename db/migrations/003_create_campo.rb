Sequel.migration do
	up do
    create_table(:campos) do
      primary_key :id
      String :nombre, null: false, size: 30
      Float :area, null: false
      Integer :distrito_id, null: false
      String :imagen_id, null: true
    end

    alter_table(:campos) do
      add_foreign_key :asociacion_id, :asociaciones
    end
	end

	down do
    drop_column :campos, :asociacion_id
		drop_table(:campos)
	end
end