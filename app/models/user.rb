class User < ActiveRecord::Base
  attr_accessible :name, :oauth_expires_at, :oauth_token, :provider, :uid
  
  def self.find_or_create_user_from_omniauth(auth)
    user = where(auth.slice(:provider, :uid)).first
    unless user 
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.oauth_token = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
        user.save!
    end
    return user
  end
end
