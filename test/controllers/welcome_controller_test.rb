require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test 'home page is succesful' do
    get root_url
    assert_response :success
  end
end
