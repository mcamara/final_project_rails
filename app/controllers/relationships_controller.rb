class RelationshipsController < ApplicationController
  def create
	  @relationship = current_user.following_relationships.build(followed_id: params[:followed_id])
	  if @relationship.save
	    flash[:notice] = "Following requested."
	    redirect_back fallback_location: root_path
	  else
	    flash[:error] = "Unable to request relationship."
	    redirect_back fallback_location: root_path
	  end
	end

	def destroy
	  @relationship = current_user.following_relationships.find_by(id: params[:id])
	  @relationship.destroy
	  flash[:notice] = "Removed relationship."
	  redirect_back fallback_location: root_path
	end
end
