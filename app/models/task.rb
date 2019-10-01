class Task < ApplicationRecord
    validates :name, presence: true
    validates :details, presence: true,  length:{ maximum:150 }
    validate :arri
    def arri
      if arrive == leave 
        errors.add(:leave, "must be be different to arrive time")
      # elsif arrive <= created_at
      #   errors.add(:leave, "please put again arrive time")
      #   elsif leave <= created_at
      #     errors.add(:leave, "please u time is under for arrive time")
      end
    end
end
