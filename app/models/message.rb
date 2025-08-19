class Message < ApplicationRecord
  belongs_to :routine
  validates :content, presence: true
  validates :role, presence: true
end
