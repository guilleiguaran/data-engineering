IMPORT_QUEUE = GirlFriday::WorkQueue.new(:import_queue) do |import|
  # Iterate through the file and sum total
  total_amount = 0
  CSV.foreach(import[:file_path], :col_sep => "\t", headers: true) do |row|
    purchaser = row["purchaser name"]
    description = row["item description"]
    price = row["item price"]
    count = row["purchase count"]
    merchant_address = row["merchant address"]
    merchant_name = row["merchant name"]
    merchant = Merchant.where(name: merchant_name, address: merchant_address).first_or_create!
    item = merchant.items.where(description: description, price: price).first_or_create!
    user = User.where(name: purchaser).first_or_create!
    Purchase.create!(user: user, item: item, count: count)
    total_amount += price.to_f * count.to_i
  end
  total_amount
end
