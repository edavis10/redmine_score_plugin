# Use rake db:migrate_plugins to migrate installed plugins
class ScoreGroup < ActiveRecord::Base; end
class ScoreOption < ActiveRecord::Base; end

class AddDefaultData < ActiveRecord::Migration

  def self.up
    sg_1 = ScoreGroup.create({ :name => "Profit"})
    sg_2 = ScoreGroup.create({ :name => "Time Required"})
    sg_3 = ScoreGroup.create({ :name => "Size"})
    sg_4 = ScoreGroup.create({ :name => "Risk"})
    
    # Score Group 1
    ScoreOption.create({ :score_group_id => sg_1.id, :value => 1, :name => 'Low' })
    ScoreOption.create({ :score_group_id => sg_1.id, :value => 2, :name => 'Med' })
    ScoreOption.create({ :score_group_id => sg_1.id, :value => 3, :name => 'High' })

    # Score Group 2
    ScoreOption.create({ :score_group_id => sg_2.id, :value => 1, :name => 'Low' })
    ScoreOption.create({ :score_group_id => sg_2.id, :value => 2, :name => 'Med' })
    ScoreOption.create({ :score_group_id => sg_2.id, :value => 3, :name => 'High' })

    # Score Group 3
    ScoreOption.create({ :score_group_id => sg_3.id, :value => 1, :name => 'Low' })
    ScoreOption.create({ :score_group_id => sg_3.id, :value => 2, :name => 'Med' })
    ScoreOption.create({ :score_group_id => sg_3.id, :value => 3, :name => 'High' })

    # Score Group 4
    ScoreOption.create({ :score_group_id => sg_4.id, :value => 1, :name => 'Low' })
    ScoreOption.create({ :score_group_id => sg_4.id, :value => 2, :name => 'Med' })
    ScoreOption.create({ :score_group_id => sg_4.id, :value => 3, :name => 'High' })

  end

  def self.down
    ScoreGroup.delete_all
    ScoreOption.delete_all
  end
end
