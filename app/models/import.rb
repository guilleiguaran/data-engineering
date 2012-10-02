require 'csv'

class Import < ActiveRecord::Base
  # Validations
  validates :file, presence: true

  # Virtual attributes
  attr_accessor :file

  # Callbacks
  after_create :import_file

  private

  def import_file
    # Iterate through the file and sum total
    total_amount = 0
    CSV.foreach(self.file.path, :col_sep => "\t", headers: true) do |row|
      purchaser = row["purchaser name"]
      description = row["item description"]
      price = row["item price"]
      count = row["purchase count"]
      merchant_address = row["merchant address"]
      merchant_name = row["merchant name"]
      merchant = Merchant.where(name: merchant_name, address: merchant_address).first_or_create!
      merchant.items.where(description: description, price: price).first_or_create!
      User.where(name: purchaser).first_or_create!
      total_amount += price.to_f * count.to_i
    end
    self.update_attribute(:total_amount, total_amount)
  end
end
