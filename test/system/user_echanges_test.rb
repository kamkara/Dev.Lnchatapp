require "application_system_test_case"

class UserEchangesTest < ApplicationSystemTestCase
  setup do
    @user_echange = user_echanges(:one)
  end

  test "visiting the index" do
    visit user_echanges_url
    assert_selector "h1", text: "User echanges"
  end

  test "should create user echange" do
    visit user_echanges_url
    click_on "New user echange"

    fill_in "Course", with: @user_echange.course_id
    fill_in "Slug", with: @user_echange.slug
    fill_in "Title", with: @user_echange.title
    fill_in "User", with: @user_echange.user_id
    click_on "Create User echange"

    assert_text "User echange was successfully created"
    click_on "Back"
  end

  test "should update User echange" do
    visit user_echange_url(@user_echange)
    click_on "Edit this user echange", match: :first

    fill_in "Course", with: @user_echange.course_id
    fill_in "Slug", with: @user_echange.slug
    fill_in "Title", with: @user_echange.title
    fill_in "User", with: @user_echange.user_id
    click_on "Update User echange"

    assert_text "User echange was successfully updated"
    click_on "Back"
  end

  test "should destroy User echange" do
    visit user_echange_url(@user_echange)
    click_on "Destroy this user echange", match: :first

    assert_text "User echange was successfully destroyed"
  end
end
