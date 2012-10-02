class Purchase < ActiveRecord::Base
  # Validations
  validates :user, presence: true
  validates :item, presence: true
  validates :count, presence: true

  # Associations
  belongs_to :user
  belongs_to :item
end
