require "application_system_test_case"

class FlashesTest < ApplicationSystemTestCase
  setup do
    @flash = flashes(:one)
  end

  test "visiting the index" do
    visit flashes_url
    assert_selector "h1", text: "Flashes"
  end

  test "should create flash" do
    visit flashes_url
    click_on "New flash"

    fill_in "Course", with: @flash.course_id
    fill_in "Slug", with: @flash.slug
    fill_in "Title", with: @flash.title
    fill_in "User", with: @flash.user_id
    click_on "Create Flash"

    assert_text "Flash was successfully created"
    click_on "Back"
  end

  test "should update Flash" do
    visit flash_url(@flash)
    click_on "Edit this flash", match: :first

    fill_in "Course", with: @flash.course_id
    fill_in "Slug", with: @flash.slug
    fill_in "Title", with: @flash.title
    fill_in "User", with: @flash.user_id
    click_on "Update Flash"

    assert_text "Flash was successfully updated"
    click_on "Back"
  end

  test "should destroy Flash" do
    visit flash_url(@flash)
    click_on "Destroy this flash", match: :first

    assert_text "Flash was successfully destroyed"
  end
end
