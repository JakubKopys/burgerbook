Hanami::Model.migration do
  change do
    create_table :users do
      primary_key :id

      column :email, String, null: false
      column :password, String, null: false
      column :first_name, String, null: false
      column :last_name, String, null: false
      # we could delete that and move to the many-to-many record
      column :admin, TrueClass, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false

      index :email, { unique: true }
    end
  end
end
