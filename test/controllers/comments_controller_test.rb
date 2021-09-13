require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @comment = comments(:one)
    sign_in users(:john)
  end

  test 'should get index' do
    get comments_url
    assert_response :success
  end

  test 'should get new' do
    get new_comment_url
    assert_response :success
  end

  test 'should show comment' do
    get comment_url(@comment)
    assert_response :success
  end

  test 'should get edit' do
    get edit_comment_url(@comment)
    assert_response :success
  end

  test 'should update comment' do
    patch comment_url(@comment), params: { comment: { body: @comment.body, twat_id: @comment.twat_id } }
    assert_redirected_to comment_url(@comment)
  end

  test 'should destroy comment' do
    assert_difference('Comment.count', -1) do
      delete comment_url(@comment)
    end

    assert_redirected_to comments_url
  end
end
