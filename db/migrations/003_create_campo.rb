Sequel.migration do
	up do
    create_table(:campos) do
      primary_key :id
      String :nombre, null: false, size: 30
      Float :area, null: false
      Integer :distrito_id, null: false
    end
	end

	down do
		drop_table(:campos)
	end
end