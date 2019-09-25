class Task < ApplicationRecord
    validates :name, presence: true
    validates :details, presence: true,  length:{ maximum:150 }
    default_scope { order(arrive: :desc)}
end
