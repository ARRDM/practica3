class AddMUserToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :m_user, index: true, foreign_key: true
  end
end
