class Task < ApplicationRecord
    validates :name, presence: true
    validates :details, presence: true,  length:{ maximum:150 }

    default_scope { order(arrive: :desc)}


    # validate :arri

    # def arri
    #   if arrive == leave 
    #     errors.add(:leave, "must be be different to arrive time")
    #   end
    # end


end
