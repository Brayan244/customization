class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  class << self
    def create_anonymous_user
      user = User.create!(email: "email-#{rand(100000000)}@example", password: "password")
      AnonymousUser.create(user: user, name: "Anonymous User #{user.id}")
    end
  end
end