require 'test_helper'

class StaffControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get staff_top_url
    assert_response :success
  end

end
