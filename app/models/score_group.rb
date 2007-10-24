class ScoreGroup < ActiveRecord::Base
  has_many :score_group_options
  has_many :scores, :through => :score_group_options

  def self.find_project_scores
    return ScoreGroup.find(:all, :include => [ :score_group_options, :scores ])
  end
end
