class ScoreGroupOption < ActiveRecord::Base
  belongs_to :score_group
  has_many :scores
end
