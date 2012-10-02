require 'test_helper'

class ImportTest < ActiveSupport::TestCase
  test "#create import attached file" do
    file_path = Rails.root.join("test", "fixtures", "example_input.tab")
    uploaded_file = Rack::Test::UploadedFile.new(file_path, "text/plain")
    import = Import.create!(file: uploaded_file)

    assert import.completed?
    assert_equal 95.0, import.total_amount
  end
end
