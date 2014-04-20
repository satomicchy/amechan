require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @need    = needs(:one)
    @comment = comments(:one)
  end

  # test "should get index" do
  #   get :index
  #   assert_response :success
  #   assert_not_nil assigns(:comments)
  # end

  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end

  test "should create comment" do
    assert_difference('Comment.count') do
      post :create, need_id: @need.id, comment: { memo: @comment.memo, need_id: @comment.need_id, staff_id: @comment.staff_id }
    end

    assert_redirected_to need_path(@need)
  end

  # test "should show comment" do
  #   get :show, id: @comment
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get :edit, id: @comment
  #   assert_response :success
  # end

  # test "should update comment" do
  #   patch :update, id: @comment, comment: { memo: @comment.memo, need_id: @comment.need_id, staff_id: @comment.staff_id }
  #   assert_redirected_to comment_path(assigns(:comment))
  # end

  # test "should destroy comment" do
  #   assert_difference('Comment.count', -1) do
  #     delete :destroy, id: @comment
  #   end

  #   assert_redirected_to comments_path
  # end
end
