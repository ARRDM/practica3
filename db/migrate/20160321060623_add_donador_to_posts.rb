class AddDonadorToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :donador, :integer
  end
end
