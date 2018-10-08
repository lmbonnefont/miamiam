require 'test_helper'

class ListedecoursesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get listedecourses_show_url
    assert_response :success
  end

end
