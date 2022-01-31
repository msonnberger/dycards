require "test_helper"

class FlashcardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get flashcards_index_url
    assert_response :success
  end

  test "should get new" do
    get flashcards_new_url
    assert_response :success
  end

  test "should get create" do
    get flashcards_create_url
    assert_response :success
  end

  test "should get show" do
    get flashcards_show_url
    assert_response :success
  end

  test "should get edit" do
    get flashcards_edit_url
    assert_response :success
  end

  test "should get update" do
    get flashcards_update_url
    assert_response :success
  end

  test "should get destroy" do
    get flashcards_destroy_url
    assert_response :success
  end
end
