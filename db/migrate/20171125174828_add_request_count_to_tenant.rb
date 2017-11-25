class AddRequestCountToTenant < ActiveRecord::Migration[5.1]
  def change
    add_column :tenants, :request_count, :integer
  end
end
