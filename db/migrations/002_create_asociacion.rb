Sequel.migration do
	up do
    create_table(:asociaciones) do
      primary_key :id
      String :nombre, null: false, size: 30
      Float :area, null: false
      String :referencia_llegada, null: false, size: 100
      #Integer :responsable_id, null: false
    end

    alter_table(:asociaciones) do
      add_foreign_key :responsable_id, :responsables
    end
	end

	down do
    drop_column :asociaciones, :responsable_id
		drop_table(:asociaciones)
	end
end