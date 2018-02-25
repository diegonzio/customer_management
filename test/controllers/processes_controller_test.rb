require 'test_helper'

class ProcessesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get processes_index_url
    assert_response :success
  end

end
