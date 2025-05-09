require "test_helper"

class LearningPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get learning_posts_index_url
    assert_response :success
  end

  test "should get show" do
    get learning_posts_show_url
    assert_response :success
  end

  test "should get new" do
    get learning_posts_new_url
    assert_response :success
  end

  test "should get edit" do
    get learning_posts_edit_url
    assert_response :success
  end
end
