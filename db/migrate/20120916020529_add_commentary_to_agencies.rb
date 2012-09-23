class AddCommentaryToAgencies < ActiveRecord::Migration
  def change
  	add_column :agencies, :commentary, :text
  end
end
