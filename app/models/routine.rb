class Routine < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy #routine.messages
  has_many :exercises, through: :routine_exercises
  has_many :routine_exercises, dependent: :destroy

  validates :title, presence: true
  validates :goal, presence: true
end
