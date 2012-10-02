class Item < ActiveRecord::Base
  # Validations
  validates :description, presence: true
end
