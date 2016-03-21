class MUser < ActiveRecord::Base
  
  before_save :downcase_email
  before_save { self.email = email.downcase }
  has_many :posts, dependent: :destroy
  validates(:m_user_name, presence: true)
  validates(:m_user_surname, presence: true)
  validates(:blood_type_user, presence: true, length: { maximum: 4 })
  validates(:password, presence: true, length: { minimum: 6 })  
  has_secure_password

  def MUser.new_token
    SecureRandom.urlsafe_base64
  end

  def MUser.digest(string)
    cost = ActivelModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, costo: cost)
  end

  def authenticated?(atributp, token)
    digest = send("#{atributo}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  private
  def downcase_email
    self.email = email.downcase
  end

end
