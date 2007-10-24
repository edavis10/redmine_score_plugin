class ScoreGroup < ActiveRecord::Base
  # TODO: should only allow one score per project
  has_many :scores

  def project_score_value(project)
    self.scores.each do |score|
      if score.project_id == project.id
        return score.value
      end
    end
    return "Not scored"
  end

end
