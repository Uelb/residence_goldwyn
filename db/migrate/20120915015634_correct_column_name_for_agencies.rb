class CorrectColumnNameForAgencies < ActiveRecord::Migration
  def change
  	remove_column :agencies, :clien_last_name
  	add_column :agencies, :client_last_name, :string
  end

end
