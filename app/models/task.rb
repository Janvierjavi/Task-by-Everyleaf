class Task < ApplicationRecord
    validates :name, presence: true
    validates :status, presence: true
    validates :details, presence: true,  length:{ maximum:150 }
    validate :arri
    def arri
      if arrive == leave 
        errors.add(:leave, "must be be different to arrive time")
         elsif leave <= arrive
           errors.add(:leave, "please u time is under for arrive time")
      end
    end
    def self.search(search)
    if search
      where(["name LIKE ?", "%#{search}%"])
    else 
      all
    end
    end
end
