class CreatePlays < ActiveRecord::Migration[5.2]
  def change
    create_table :plays do |t|
      t.string :title
      t.string :video_url
      t.string :game
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
