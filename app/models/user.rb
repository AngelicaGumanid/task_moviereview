class User < ApplicationRecord
  has_many :movies, dependent: :destroy
  has_many :reviews

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_writer :login

  def login
    @login || self.username
  end

  # Allow user to sign in using username instead of email
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["username = :value", { value: login }]).first
    elsif conditions.key?(:username)
      where(conditions.to_h).first
    end
  end
end
