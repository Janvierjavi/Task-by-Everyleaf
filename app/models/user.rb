class User < ApplicationRecord
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  validates :email,uniqueness: true, length: { maximum: 30 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :name,  presence: true, length: { maximum: 19 }
  has_many :tasks
  def self.adminu
   @users = User.all
 @adminu=0
   @users.each do |user|
     if user.admin?
       @adminu += 1
     end
   end
   return @adminu
 end
end
