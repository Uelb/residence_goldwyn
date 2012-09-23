class AddCountryToAgencies < ActiveRecord::Migration
  def change
  	add_column :agencies, :country, :string
  end
end
