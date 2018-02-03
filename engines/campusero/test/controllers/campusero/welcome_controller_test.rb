require 'test_helper'

module Campusero
  class WelcomeControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    test "should get index" do
      get welcome_index_url
      assert_response :success
    end

  end
end
