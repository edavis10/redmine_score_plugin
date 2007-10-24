class ScoresController < ApplicationController
  layout 'base'
  before_filter :find_project, :authorize


  def index
    @scores = Score.find_all_by_project_id(@project.id)
  end

  def edit
    case request.method
    when :post
      @score = Score.find(params[:score_id]) || Score.new
      @score.score_group_option_id = params[:score_group][:id]
      @score.project_id = @project
      @score.save
      redirect_to :action => 'index', :id => @project
    when :get
      @scores = Score.find_all_by_project_id(@project.id)
    end
  end


private
  def find_project
    @project=Project.find(params[:id])
  end

  def find_groups
    @groups = ScoreGroup.find(:all, :include => [ :score_group_options ])
  end
end
