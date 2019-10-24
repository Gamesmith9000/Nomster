class Place < ApplicationRecord
  belongs_to :user
  has_many :comments

  geocoded_by :address
  after_validation :geocode

  validates :name, presence: true, length: { minimum: 4 }
  validates :address, presence: true
  validates :description, presence: true

  # IMPORTANT: The built-in Rails validations take place at the MODEL level
end
