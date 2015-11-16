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
  end

  private
  def idea_params
    params.require(:idea).permit([:title, :body])
  end

end
