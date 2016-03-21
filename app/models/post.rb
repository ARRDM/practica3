class Post < ActiveRecord::Base
  belongs_to :m_user, required: true
  validates :title, presence: true, length: { minimum: 5 }
  validates :blood_type_post, presence: true
  validates :location_post, presence: true
  validates :phone_post, presence: true
  validates :description, presence: true, length: { minimum: 10 }

end
