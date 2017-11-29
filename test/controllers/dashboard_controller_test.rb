require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "can view the dashboard" do
    get "/"
    assert_select "nav" 
  end
end
