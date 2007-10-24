# Use rake db:migrate_plugins to migrate installed plugins
class CreateScoresTable < ActiveRecord::Migration
  def self.up
    # Record per group, e.x. "Profit"
    create_table :score_groups, :force => true do |t|
      t.column "name", :string
    end

    # Record per value per group, e.x. "Low Profit", "High Profit"
    create_table :score_group_options, :force => true do |t|
      t.column "name", :string
      t.column "score_group_id", :integer
    end

    # Links scores to projects
    create_table :scores, :force => true do |t|
      t.column "score_group_option_id", :integer
      t.column "project_id", :integer
    end

  end

  def self.down
    drop_table :scores
    drop_table :score_groups
    drop_table :score_group_options
  end
end
