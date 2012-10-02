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
    IMPORT_QUEUE.push(:file_path => self.file.path) do |total_amount|
      self.update_attributes!(:total_amount => total_amount, :completed => true)
    end
  end
end
