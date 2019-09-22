class AddVotesCountToPlay < ActiveRecord::Migration[5.2]
  def change
    add_column :plays, :votes_count, :integer
    Play.reset_column_information

    Play.all.each do |e|
      Play.update_counters e.id, :votes_count => e.votes.length
    end
  end
end
