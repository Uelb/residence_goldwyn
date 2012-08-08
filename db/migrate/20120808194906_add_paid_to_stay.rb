class AddPaidToStay < ActiveRecord::Migration
  def change
    add_column :stays, :paid, :boolean, :default => false
  end
end
