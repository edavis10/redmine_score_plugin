class ScoresController < ApplicationController
  layout 'base'
  before_filter :find_project, :authorize


  def index
    @score_groups = ScoreGroup.find(:all, :include => [:scores])
  end

  def edit
    case request.method
    when :post
      @score = Score.find(:first, :conditions => ["project_id IN (?) AND score_group_id IN (?)",@project.id,params[:score_group_id]])
      # Handle if the finder didn't find anything
      # would be nice if we could use find_or_create_by with two params
      if @score.nil?
        @score = Score.new
      end

      @score.project_id = @project.id
      @score.score_group_id = params[:score_group_id]
      @score.value = params[:score][:value]
      @score.save
      redirect_to :action => 'index', :id => @project
    when :get
      # TODO: select the current value, will require limited the ScoreGroup find to the current project
      @score_groups = ScoreGroup.find(:all, :include => [:scores])
    end
  end


private
  def find_project
    @project=Project.find(params[:id])
  end
end
