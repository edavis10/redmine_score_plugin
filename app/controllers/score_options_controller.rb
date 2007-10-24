class ScoreOptionsController < ApplicationController
  layout 'base'
  before_filter :find_project, :authorize


  def index
    @score_groups = ScoreGroup.find(:all, :include => [:scores])
  end

  def edit
    case request.method
    when :post
      @score_options = params[:score_option]
      @score_options.each do |id,text|
        
        @score_option = ScoreOption.find_or_create_by_id(id)

        @score_option.name = text
        if not @score_option.save
          flash[:error] = "Opps, your score option did not save.  Sorry"
        end

      end

      flash[:notice] = "Saved score options"
      redirect_to :action => 'index', :id => @project
    when :get
      @score_groups = ScoreGroup.find(:all, :include => [:score_options])
    end
  end


private
  def find_project
    @project=Project.find(params[:id])
  end
end
