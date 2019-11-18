class User < ApplicationRecord
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  validates :email,uniqueness: true, length: { maximum: 30 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :name,  presence: true, length: { maximum: 19 }
  has_many :tasks , dependent: :delete_all
  has_many :labels

 def self.admin
    @users = User.all
    @admins = 0
    @users.each do |user|
      if user.admin?
        @admins += 1
      end
    end
    return @admins
  end
end
