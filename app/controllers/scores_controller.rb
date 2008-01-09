class ScoresController < ApplicationController
  unloadable
  layout 'base'
  before_filter :find_project, :authorize


  def index
    @score_groups = ScoreGroup.find(:all, :include => [:scores])
    @score_total = Score.project_totals(@project.id)
  end

  def edit
    case request.method
    when :post
      @scores = params[:score_group]
      @scores.each do |group_id,scoring|

        @score = Score.find(:first, :conditions => ["project_id IN (?) AND score_group_id IN (?)",@project.id,group_id])
        # Handle if the finder didn't find anything
        # would be nice if we could use find_or_create_by with two params
        if @score.nil?
          @score = Score.new
        end

        @score.project_id = @project.id
        @score.score_group_id = group_id
        @score.value = scoring
        if not @score.save
          flash[:error] = "Opps, your score for Group ##{group_id} did not save.  Sorry"
        end

      end

      flash[:notice] = "Saved scores"
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
