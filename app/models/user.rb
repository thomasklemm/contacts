class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :accounts, dependent: :destroy

  def facebook_client
    @client ||= Koala::Facebook::API.new(accounts.first.oauth_token)
  end
end
