class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @comment = Comment.all
  end
  
  def new
    @comment = Comment.new(photo_id: params[:photo_id])
  end
  
  def create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:success] = "Comment successfully added!"
      redirect_to photo_path(@photo)
    else
      redirect_to photo_path(@photo)
    end
  end
  
  def show
    @comment = Comment.find(params[:id])
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:body, :photo_id)
  end
end
