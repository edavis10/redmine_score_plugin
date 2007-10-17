class ScoresController < ApplicationController
  layout 'base'
  before_filter :find_project, :authorize


  def index
    case request.method
    when :post
    when :get
    end
  end


private
  def find_project
    @project=Project.find(params[:id])
  end
end
