require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get student" do
    get :student
    assert_response :success
  end

end
