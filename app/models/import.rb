class Import < ActiveRecord::Base
  # Validations
  validates :total_amount, presence: true
end
