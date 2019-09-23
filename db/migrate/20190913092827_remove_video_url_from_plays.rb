class RemoveVideoUrlFromPlays < ActiveRecord::Migration[5.2]
  def change
    remove_column :plays, :video_url, :string
  end
end
