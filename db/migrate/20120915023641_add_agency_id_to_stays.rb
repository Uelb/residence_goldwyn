class AddAgencyIdToStays < ActiveRecord::Migration
  def change
  	add_column :stays, :agency_id, :integer
  end
end
