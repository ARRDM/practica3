class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :blood_type_post
      t.string :location_post
      t.string :phone_post
      t.text :description
      t.timestamps null: false
    end
  end
end
