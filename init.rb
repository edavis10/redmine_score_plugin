# Redmine sample plugin
require 'redmine'

RAILS_DEFAULT_LOGGER.info 'Starting Project Scores plugin for Redmine'

Redmine::Plugin.register "scores_plugin" do
  name 'Project Scores Plugin'
  author 'Eric Davis of Little Stream Software'
  description 'This is a scoring plugin for Redmine that will allow projects to be scored'
  version '0.0.1'

  # This plugin adds a project module
  # It can be enabled/disabled at project level (Project settings -> Modules)
  project_module :score_module do
    # This permission has to be explicitly given
    # It will be listed on the permissions screen
    permission :view_scores, {:scores => [:index]}
    permission :edit_scores, {:scores => [:edit]}
    permission :view_score_options, {:score_options => [:index]}
    permission :edit_score_options, {:score_options => [:edit]}
  end

  # A new item is added to the project menu (because Redmine can't add it anywhere else)
  menu :project_menu, "Scores", :controller => 'scores', :action => 'index'
end
