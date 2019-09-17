class RemoveTermsFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :terms
  end
end
