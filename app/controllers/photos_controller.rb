class PhotosController < ApplicationController
  before_action :authenticate_user!

  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
    @comments = Comment.where(photo: @photo)
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user = current_user

    if @photo.save
      flash[:success] = "Photo successfully uploaded!"
      redirect_to photo_path(@photo)
    else
      flash[:alert] = "Photo is unsuccessfully uploaded!"
      render 'new'
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
	  @photo.destroy
	  flash[:alert] = "Removed photo."
	  redirect_back fallback_location: root_path
	end
 
  private
  def photo_params
    params.require(:photo).permit(:photo_id, :title, :description, :image)
  end
end
