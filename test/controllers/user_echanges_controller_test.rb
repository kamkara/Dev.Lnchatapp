require "test_helper"

class UserEchangesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_echange = user_echanges(:one)
  end

  test "should get index" do
    get user_echanges_url
    assert_response :success
  end

  test "should get new" do
    get new_user_echange_url
    assert_response :success
  end

  test "should create user_echange" do
    assert_difference("UserEchange.count") do
      post user_echanges_url, params: { user_echange: { course_id: @user_echange.course_id, slug: @user_echange.slug, title: @user_echange.title, user_id: @user_echange.user_id } }
    end

    assert_redirected_to user_echange_url(UserEchange.last)
  end

  test "should show user_echange" do
    get user_echange_url(@user_echange)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_echange_url(@user_echange)
    assert_response :success
  end

  test "should update user_echange" do
    patch user_echange_url(@user_echange), params: { user_echange: { course_id: @user_echange.course_id, slug: @user_echange.slug, title: @user_echange.title, user_id: @user_echange.user_id } }
    assert_redirected_to user_echange_url(@user_echange)
  end

  test "should destroy user_echange" do
    assert_difference("UserEchange.count", -1) do
      delete user_echange_url(@user_echange)
    end

    assert_redirected_to user_echanges_url
  end
end
