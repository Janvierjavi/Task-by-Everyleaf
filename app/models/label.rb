class Label < ApplicationRecord
  belongs_to :user
  has_many :tasks_labels, dependent: :destroy
  has_many :tasks, through: :tasks_labels
 accepts_nested_attributes_for :tasks_labels, :reject_if => proc { |a|
   a['label_id'].blank? }
 accepts_nested_attributes_for :tasks
end
