class AddApprovedToAgency < ActiveRecord::Migration
  def self.up
    add_column :agencies, :approved, :boolean, :default => false, :null => false
    add_index  :agencies, :approved
  end

  def self.down
    remove_index  :agencies, :approved
    remove_column :agencies, :approved
  end
end