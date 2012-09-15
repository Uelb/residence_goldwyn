class CreateSupersizedImages < ActiveRecord::Migration
  def change
    create_table :supersized_images do |t|
      t.boolean :visible, :default => true
      t.attachment :image

      t.timestamps
    end
  end
end
