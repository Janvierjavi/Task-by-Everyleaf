class Task < ApplicationRecord
    validates :name, presence: true
    validates :details, presence: true,  length:{ maximum:150 }
end
