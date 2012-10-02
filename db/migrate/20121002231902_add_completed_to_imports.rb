class AddCompletedToImports < ActiveRecord::Migration
  def change
    add_column :imports, :completed, :boolean, default: false
  end
end
