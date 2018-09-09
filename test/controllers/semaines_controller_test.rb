require 'test_helper'

class SemainesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get semaines_new_url
    assert_response :success
  end

  test "should get create" do
    get semaines_create_url
    assert_response :success
  end

  test "should get show" do
    get semaines_show_url
    assert_response :success
  end

end
