class Account < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true

  # Create or update an account given an omniauth auth hash
  # Returns the account
  def self.from_omniauth(user, auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |account|
      account.user = user
      account.provider = auth.provider
      account.uid = auth.uid
      account.name = auth.info.name
      account.oauth_token = auth.credentials.token
      account.oauth_expires_at = Time.at(auth.credentials.expires_at)
      account.save!
    end
  end
end
