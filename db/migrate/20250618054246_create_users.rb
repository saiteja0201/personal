class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :phn_number
      t.integer :id_number

      t.timestamps
    end
  end
end
