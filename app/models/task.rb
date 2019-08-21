class Task < ApplicationRecord
  belongs_to :list
  validates :description, presence: true, length: { minimum: 5 }
end
