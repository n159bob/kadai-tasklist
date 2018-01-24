require 'test_helper'

class TasklinesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get tasklines_create_url
    assert_response :success
  end

  test "should get destroy" do
    get tasklines_destroy_url
    assert_response :success
  end

end
