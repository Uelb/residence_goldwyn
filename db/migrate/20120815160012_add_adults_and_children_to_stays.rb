class AddAdultsAndChildrenToStays < ActiveRecord::Migration
  def change
    add_column :stays, :number_of_adults, :integer, :null => false
    add_column :stays, :number_of_children, :integer, :default => 0 
  end
end
