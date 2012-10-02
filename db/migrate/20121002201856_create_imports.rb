class CreateImports < ActiveRecord::Migration
  def change
    create_table :imports do |t|
      t.float :total_amount

      t.timestamps
    end
  end
end
