class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :lastname
      t.string :phone_1
      t.string :phone_2
      t.string :email
      t.string :responsable_id
      t.references :position, foreign_key: true
      t.references :software, foreign_key: true
      t.references :estate, foreign_key: true

      t.timestamps
    end
  end
end
