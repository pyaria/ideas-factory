class CommentsController < ApplicationController
  before_action :authenticate_user

  def create
    comment = current_user.comments.new(params.require(:comment).permit([:body]))
    idea = Idea.find params[:idea_id]
    comment.idea = idea
    if comment.save
      redirect_to idea_path(idea), notice: "Thank you for commenting!"
    else
      redirec_to idea_path(idea), alert: "Unable to comment!"
    end
  end

end
