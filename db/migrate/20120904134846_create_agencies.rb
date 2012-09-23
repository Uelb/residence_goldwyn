class CreateAgencies < ActiveRecord::Migration
  def change
    create_table :agencies do |t|
      t.string :name
      t.string :password
      t.string :client_first_name
      t.string :clien_last_name
      t.string :email
      t.string :tva_number

      t.timestamps
    end
  end
end
