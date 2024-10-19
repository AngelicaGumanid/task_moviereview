class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["username = :value", { value: login }]).first
    elsif conditions.key?(:username)
      where(conditions.to_h).first
    end
  end

  class User < ApplicationRecord
    attr_writer :login

    def login
      @login || self.username
    end
  end

end
