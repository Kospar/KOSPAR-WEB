require 'test_helper'

class TrendsControllerTest < ActionController::TestCase
  test "should get latest" do
    get :latest
    assert_response :success
  end

end
