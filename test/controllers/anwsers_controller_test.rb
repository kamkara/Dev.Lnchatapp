require "test_helper"

class AnwsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @anwser = anwsers(:one)
  end

  test "should get index" do
    get anwsers_url
    assert_response :success
  end

  test "should get new" do
    get new_anwser_url
    assert_response :success
  end

  test "should create anwser" do
    assert_difference("Anwser.count") do
      post anwsers_url, params: { anwser: { question_id: @anwser.question_id, user_id: @anwser.user_id } }
    end

    assert_redirected_to anwser_url(Anwser.last)
  end

  test "should show anwser" do
    get anwser_url(@anwser)
    assert_response :success
  end

  test "should get edit" do
    get edit_anwser_url(@anwser)
    assert_response :success
  end

  test "should update anwser" do
    patch anwser_url(@anwser), params: { anwser: { question_id: @anwser.question_id, user_id: @anwser.user_id } }
    assert_redirected_to anwser_url(@anwser)
  end

  test "should destroy anwser" do
    assert_difference("Anwser.count", -1) do
      delete anwser_url(@anwser)
    end

    assert_redirected_to anwsers_url
  end
end
