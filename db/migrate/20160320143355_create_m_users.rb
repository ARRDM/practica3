class CreateMUsers < ActiveRecord::Migration
  def change
    create_table :m_users do |t|
      t.string :m_user_name
      t.string :m_user_surname
      t.string :blood_type_user
      t.string :email
      t.string :password
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
