require 'test_helper'

class SoftwaresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get softwares_index_url
    assert_response :success
  end

end
