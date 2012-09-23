class AddMobilePhoneAndPhoneAndAdressToAgencies < ActiveRecord::Migration
  def change
  	add_column :agencies, :mobile_phone, :integer
  	add_column :agencies, :phone, :integer
  	add_column :agencies, :address, :string
  	add_column :agencies, :zip_code, :integer

  end
end
