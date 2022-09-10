require "test_helper"

class FlashesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @flash = flashes(:one)
  end

  test "should get index" do
    get flashes_url
    assert_response :success
  end

  test "should get new" do
    get new_flash_url
    assert_response :success
  end

  test "should create flash" do
    assert_difference("Flash.count") do
      post flashes_url, params: { flash: { course_id: @flash.course_id, slug: @flash.slug, title: @flash.title, user_id: @flash.user_id } }
    end

    assert_redirected_to flash_url(Flash.last)
  end

  test "should show flash" do
    get flash_url(@flash)
    assert_response :success
  end

  test "should get edit" do
    get edit_flash_url(@flash)
    assert_response :success
  end

  test "should update flash" do
    patch flash_url(@flash), params: { flash: { course_id: @flash.course_id, slug: @flash.slug, title: @flash.title, user_id: @flash.user_id } }
    assert_redirected_to flash_url(@flash)
  end

  test "should destroy flash" do
    assert_difference("Flash.count", -1) do
      delete flash_url(@flash)
    end

    assert_redirected_to flashes_url
  end
end
