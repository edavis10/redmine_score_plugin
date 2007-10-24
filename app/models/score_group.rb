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

  def option_values
    options = [
               ["Low","1"],
               ["Med-Low","2"],
               ["Medium","3"],
               ["Med-High","4"],
               ["High","5"],
              ]
    return options;
  end
end
