class LikesController < ApplicationController

  def create
    like = current_user.likes.new
    idea = Idea.find params[:idea_id]
    like.idea = idea
    if current_user != idea.user
      like.save
      redirect_to idea_path(idea), notice: "Thanks for liking!"
    else
      redirect_to idea_path(idea), alert: "No liking your own idea!"
    end
  end

  def destroy
  end

end
