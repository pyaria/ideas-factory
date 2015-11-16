class JoinsController < ApplicationController
  before_action :authenticate_user, :idea

  def create
    join = current_user.joins.new
    join.idea = idea
    if join.save
      redirect_to idea_path(idea), notice: "You've joined #{idea.title}!"
    else
      redirect_to idea_path(idea), alert: "Unable to join #{idea.title}!"
    end
  end

  private
  def idea
    Idea.find params[:idea_id]
  end
end
