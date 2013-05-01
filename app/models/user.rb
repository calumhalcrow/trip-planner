class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :email, type: String
  field :provider, type: String
  field :uid, type: String
  field :oauth_token, type: String
  field :oauth_expires_at, type: DateTime

  validates :name, :length => { :minimum => 1, :allow_blank => false }
  validates :email, :length => { :minimum => 6, :allow_blank => false }

  has_many :trips
  has_one :home, class_name: "Location::Home"

  def self.from_omniauth(auth)
    User.find_or_initialize_by(auth.slice(:provider, :uid)).tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
