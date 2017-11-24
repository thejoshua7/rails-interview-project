class CreateTenants < ActiveRecord::Migration[4.2]
  def change
    create_table :tenants do |t|
      t.string :name,    null: false
      t.string :api_key, null: false

      t.timestamps null: false
    end
  end
end
