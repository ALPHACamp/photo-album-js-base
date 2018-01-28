class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_create :generate_authentication_token

  def generate_authentication_token
    # Devise.friendly_token 會自動產生 20 字元長的亂數
    self.authentication_token = Devise.friendly_token
  end
end
