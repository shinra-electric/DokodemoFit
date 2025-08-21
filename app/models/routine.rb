class Routine < ApplicationRecord
  acts_as_chat
  belongs_to :user
  has_many :messages, dependent: :destroy #routine.messages
  has_many :exercises, through: :routine_exercises
  has_many :routine_exercises, dependent: :destroy
  validates :title, presence: true
  validates :goal, presence: true
  after_initialize :set_chat
  def set_chat
    @chat = RubyLLM.chat
  end
end
