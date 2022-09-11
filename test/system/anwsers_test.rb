require "application_system_test_case"

class AnwsersTest < ApplicationSystemTestCase
  setup do
    @anwser = anwsers(:one)
  end

  test "visiting the index" do
    visit anwsers_url
    assert_selector "h1", text: "Anwsers"
  end

  test "should create anwser" do
    visit anwsers_url
    click_on "New anwser"

    fill_in "Content", with: @anwser.content
    fill_in "Question", with: @anwser.question_id
    fill_in "User", with: @anwser.user_id
    click_on "Create Anwser"

    assert_text "Anwser was successfully created"
    click_on "Back"
  end

  test "should update Anwser" do
    visit anwser_url(@anwser)
    click_on "Edit this anwser", match: :first

    fill_in "Content", with: @anwser.content
    fill_in "Question", with: @anwser.question_id
    fill_in "User", with: @anwser.user_id
    click_on "Update Anwser"

    assert_text "Anwser was successfully updated"
    click_on "Back"
  end

  test "should destroy Anwser" do
    visit anwser_url(@anwser)
    click_on "Destroy this anwser", match: :first

    assert_text "Anwser was successfully destroyed"
  end
end
