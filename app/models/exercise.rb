class Exercise < ApplicationRecord
  has_many :routine_exercises
  validates :name, presence: true
  validates :description, presence: true
  # validates :category, presence: true
  # validates :muscle_group, presence: true
end
