class Score < ActiveRecord::Base
  belongs_to :project
  belongs_to :score_group

  def self.project_totals(project_id)
    scores = Score.find_all_by_project_id(project_id)
    sum = 0
    scores.each do |score|
      sum += score.value unless score.value.nil?
    end
    return sum
  end

end
