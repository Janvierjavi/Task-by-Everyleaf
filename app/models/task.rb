class Task < ApplicationRecord
  belongs_to :user
  paginates_per 3
    validates :name, presence: true
    validates :status, presence: true
    validates :details, presence: true,  length:{ maximum:150 }
    enum priority: [:Low, :Medium, :High]
    validate :arri
    def arri
      if arrive == leave
        errors.add(:leave, "must be be different to arrive time")
         elsif leave <= arrive
           errors.add(:leave, "please u time is under for arrive time")
      end
    end
    def search
      @q = Task.ransack(params[:q])
      @tasks = @q.result
    end
    def self.order_list(sort_order)
      if sort_order == "created_at"
        order(created_at: :desc)
      elsif sort_order == "leave"
        order(leave: :desc)
      elsif sort_order == "priority"
        order(priority: :desc)
      else
        order(created_at: :desc)
      end
    end
end
