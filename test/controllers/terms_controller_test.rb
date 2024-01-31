require "test_helper"

class TermsControllerTest < ActionDispatch::IntegrationTest
  test "should get terminosycondiciones" do
    get terms_terminosycondiciones_url
    assert_response :success
  end
end
