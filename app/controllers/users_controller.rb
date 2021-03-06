class UsersController < ApplicationController
  def index
    if params[:query].present?
      user = User.where("users.username LIKE '%#{params[:query]}%'")
      render json: user
    else
      render json: User.all
    end
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show_favorites
    user = User.find(params[:id])

    render json: user.favorite_artworks
  end

  def add_favorite
    user = User.find(params[:id])
    artwork = Artwork.find(params[:artwork_id])

    if user.shared_or_owned.include?(artwork)
      if user.favorite(params[:artwork_id])
        render json: user.favorite_artworks
      else
        render json: user.errors.full_messages, status: :unprocessable_entity
      end
    else
      render plain: "You cannot favorite artworks not owned or shared!"
    end
  end

  def delete_favorite
    user = User.find(params[:id])

    if user.unfavorite(params[:artwork_id])
      render json: user.favorite_artworks
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    user = User.find(params[:id])

    render json: user
  end

  def update
    user = User.find(params[:id])

    if user.update(user_params)
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])

    if user.destroy
      render json: user
    else
      render json: "Unable to delete this entry!"
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
