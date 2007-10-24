# Use rake db:migrate_plugins to migrate installed plugins
class CreateScoresTable < ActiveRecord::Migration
  def self.up
    create_table :scores, :force => true do |t|
      t.column "value", :integer
      t.column "project_id", :integer
    end

    create_table :score_group, :force => true do |t|
      t.column "name", :string
    end

  end

  def self.down
    drop_table :scores
    drop_table :score_groups
  end
end
