class User < ActiveRecord::Base

  has_secure_password

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


end
