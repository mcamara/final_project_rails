class RelationshipsController < ApplicationController
	before_action :authenticate_user!
	
  def create
	  @relationship = current_user.following_relationships.build(followed_id: params[:followed_id])
	  if @relationship.save
	    flash[:notice] = "Following requested."
	    redirect_back fallback_location: root_path
	  else
	    flash[:alert] = "Unable to request relationship."
	    redirect_back fallback_location: root_path
	  end
	end

	def destroy
	  @relationship = current_user.following_relationships.find_by(followed_id: params[:id])
	  @relationship.destroy
	  flash[:alert] = "Removed relationship."
	  redirect_back fallback_location: root_path
	end
end
