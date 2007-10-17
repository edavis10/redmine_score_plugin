# Use rake db:migrate_plugins to migrate installed plugins
class CreateScoresTable < ActiveRecord::Migration
  def self.up
    # Record per value per group, e.x. "Low Profit", "High Profit"
    create_table :scores, :force => true do |t|
      t.column "name", :string
      t.column "score_group_id", :integer
    end

    # Record per group, e.x. "Profit"
    create_table :score_group, :force => true do |t|
      t.column "name", :string
    end

    # Links scores to projects
    create_table :project_scores, :force => true do |t|
      t.column "score_id", :integer
      t.column "project_id", :integer
    end
  end

  def self.down
    drop_table :project_scores
    drop_table :scores
    drop_table :score_group
  end
end
