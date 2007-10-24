# Use rake db:migrate_plugins to migrate installed plugins
class CreateScoreOptionsTable < ActiveRecord::Migration
  def self.up
    create_table :score_options, :force => true do |t|
      t.column "score_group_id", :integer
      t.column "value", :integer
      t.column "name", :string
    end


  end

  def self.down
    drop_table :score_options
  end
end
