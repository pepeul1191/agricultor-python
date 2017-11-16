Sequel.migration do
	up do
    create_table(:responsables) do
      primary_key :id
      String :nombres, null: false, size: 30
      String :paterno, null: false, size: 30
      String :materno, null: false, size: 30
      String :telefono, null: false, size: 30
      String :email, null: false, size: 40
    end
	end

	down do
		drop_table(:responsables)
	end
end