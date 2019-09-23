class RenameLikesToVotes < ActiveRecord::Migration[5.2]
  def change
    rename_table :likes, :votes
  end
end
