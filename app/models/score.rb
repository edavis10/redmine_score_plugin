class Score < ActiveRecord::Base
  belongs_to :project
  belongs_to :score_group

  def self.project_totals(project_id)
    scores = Score.find_all_by_project_id(project_id)
    sum = 0
    scores.each do |score|
      sum += score.value
    end
    return sum
  end


  def self.options
    options = {
      "Low" => 1,
      "Med-Low" => 2,
      "Medium" => 3,
      "Med-High" => 4,
      "High" => 5
    }
    return options;
  end

  def self.options_for_select
    return self.options.sort { |a,b| a[1] <=> b[1]};
  end

  def self.option_name_for(value)
    self.options.index(value)
  end
end
