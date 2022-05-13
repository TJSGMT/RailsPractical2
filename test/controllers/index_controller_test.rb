require "test_helper"

class IndexControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get index_create_url
    assert_response :success
  end

  test "should get edit" do
    get index_edit_url
    assert_response :success
  end
end
