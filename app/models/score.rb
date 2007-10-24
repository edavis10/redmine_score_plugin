class Score < ActiveRecord::Base
  belongs_to :project
  belongs_to :score_group
end
