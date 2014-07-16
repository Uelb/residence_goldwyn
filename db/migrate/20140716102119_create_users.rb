class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :phone
      t.boolean :is_agency

      t.timestamps
    end
  end
end
