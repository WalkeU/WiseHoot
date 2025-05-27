class User < ApplicationRecord
  has_secure_password
  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true, on: :create
end
