class User < ActiveRecord::Base

  has_secure_password
  before_create { generate_token(:auth_token) }


 # attr_accessor :password, :password_confirmation
  EMAIL_REGEX = /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\Z/i
  #validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates :password,
            presence: { on: :create },
            length: { minimum: 2, allow_blank: true }





















  def editor?
    self.role == 'editor'
  end

  def admin?
    self.role == 'admin'
  end



  # def self.from_omniauth(auth)
  #   where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
  #     user.provider = auth.provider
  #     user.uid = auth.uid
  #     user.name = auth.info.name
  #     user.oauth_token = auth.credentials.token
  #     user.oauth_expires_at = Time.at(auth.credentials.expires_at)
  #     user.save!
  #   end
  # end


  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end


end
