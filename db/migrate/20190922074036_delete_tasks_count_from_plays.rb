class DeleteTasksCountFromPlays < ActiveRecord::Migration[5.2]
  def change
  remove_column :plays, :tasks_count, :integer
  end
end
