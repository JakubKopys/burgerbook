Hanami::Model.migration do
  change do
    create_table :restaurants do
      primary_key :id

      column :address, String, null: false
      column :city, String, null: false
      column :zip_code, String, null: false
      column :name, String, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false

      index :name
      index [:address, :city], unique: true
    end
  end
end
