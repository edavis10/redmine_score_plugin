class ScoreOption < ActiveRecord::Base
  belongs_to :score_group

  def self.name_for(group,value)
    option = ScoreOption.find_by_score_group_id_and_value(group.id,value)
    if !option.nil?
      return option.name
    else
      return ""
    end
  end
end
