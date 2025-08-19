class Routine < ApplicationRecord
  belongs_to :user
  has_many :messages
  has_many exercises:, through: :routine_exercises

  validates :title, presence: true
  validates :goal, presence: true
end
