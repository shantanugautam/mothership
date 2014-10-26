class Asset < ActiveRecord::Base
  belongs_to :user

  def file_name
      uploaded_file_file_name
  end
end
