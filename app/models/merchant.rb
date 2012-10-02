class Merchant < ActiveRecord::Base
  # Validations
  validates :name, presence: true
  validates :address, presence: true

  # Associations
  has_many :items
end
