class User < ApplicationRecord
    validates :name,  presence: true, length: { maximum: 150 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  has_many :tasks
end
