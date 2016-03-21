class AddFinishedToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :finished, :boolean
  end
end
