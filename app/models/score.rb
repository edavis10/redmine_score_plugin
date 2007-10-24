class Score < ActiveRecord::Base
  belongs_to :project
  belongs_to :score_group_option

  def group_name
    return self.score_group_option.score_group.name
  end

  def group_id
    return self.score_group_option.score_group.id
  end
end
