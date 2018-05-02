class User < ActiveRecord::Base
    
  def self.find_or_create_from_auth_hash(auth_hash)
   p auth_hash[:info]
   provider = auth_hash[:provider] #providerはどのサービスで認証したのかを見分けるもの
   uid = auth_hash[:uid]
   name = auth_hash[:info][:name]
   image_url = auth_hash[:info][:image]
   screen_name = auth_hash[:info][:nickname]
   description = auth_hash[:info][:description]
   
   #find_or_create_by()は()の中の条件のものが見つければ取得し、なければ新しく作成するというメソッド
   self.find_or_create_by(provider: provider,uid: uid) do |user|
     user.username = name
     user.image_url = image_url
     user.screen_name = screen_name
     user.description = description
   end
  end
  
end
