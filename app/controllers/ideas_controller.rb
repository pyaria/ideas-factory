class IdeasController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    @ideas = Idea.all
  end

  def new
    @idea = Idea.new
  end

  def create
    idea = Idea.new(idea_params)
    if idea.save
      redirect_to root_path, notice: "Idea saved!"
    else
      render :new, alert: "Idea not saved!"
    end
  end

  def show
    @idea = Idea.find params[:id]
    @comment = Comment.new
    @comments = @idea.comments
    @joins = @idea.joins
    @members = []
    @joins.each do |join|
      @members.push join.user.first_name
    end
  end

  private
  def idea_params
    params.require(:idea).permit([:title, :body])
  end

end
