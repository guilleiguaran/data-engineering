class User < ActiveRecord::Base
  # Validations
  validates :name, presence: true
end
