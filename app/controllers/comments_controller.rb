class CommentsController < ApplicationController
  def index
    if comments_params[:user_id].present?
      render json: Comment.find_by(user_id: comments_params[:user_id])
    else
      render json: Comment.find_by(artwork_id: comments_params[:artwork_id])
    end
  end

  def create
    comment = Comment.new(comments_params)

    if comment.save
      render json: comment
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find(params[:id])

    if comment.destroy
      render json: comment
    else
      render json: "Comment cannot be deleted"
    end
  end

  private

  def comments_params
    params.require(:comments).permit(:user_id, :artwork_id, :body)
  end
end
