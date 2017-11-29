class AddRequestCountToTenant < ActiveRecord::Migration[5.1]
  def change
    add_column :tenants, :request_count, :integer, :default => 0
    Tenant.update_all(request_count: 0)
  end
end
