class AddWaitingForTransferToStay < ActiveRecord::Migration
  def change
  	add_column :stays, :waiting_for_transfer, :boolean

  end
end
