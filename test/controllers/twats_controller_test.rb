require "test_helper"

class TwatsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @twat = twats(:one)
    sign_in users(:john)
  end

  test "should get index" do
    get twats_url
    assert_response :success
  end

  test "should create twat" do
    assert_difference('Twat.count') do
      post twats_url, params: { twat: { twat: @twat.twat } }
    end

    assert_redirected_to root_path
  end

  test "should show twat" do
    get twat_url(@twat)
    assert_response :success
  end

  test "should update twat" do
    patch twat_url(@twat), params: { twat: { twat: @twat.twat } }
    assert_redirected_to twat_url(@twat)
  end

  test "should destroy twat" do
    assert_difference('Twat.count', -1) do
      delete twat_url(@twat)
    end

    assert_redirected_to twats_url
  end
end
