class FixPhoneAgencies < ActiveRecord::Migration
  def change
  	remove_column :agencies, :phone
  	remove_column :agencies, :mobile_phone
  	remove_column :agencies, :zip_code
  	add_column :agencies, :phone, :string
  	add_column :agencies, :mobile_phone, :string
  	add_column :agencies, :zip_code, :string
  end
end
