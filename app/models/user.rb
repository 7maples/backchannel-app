class User < ActiveRecord::Base
  authenticates_with_sorcery!

  # validations -> drive this with tests
  # dotenv gem

  def self.create_or_find_from_omniauth(auth)
    where(:twitter_id => auth["uid"]).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create!(:twitter_id => auth["uid"],
            :nickname   => auth["info"]["nickname"],
            :name       => auth["info"]["name"],
            :image_url  => auth["info"]["image"])
  end
end
