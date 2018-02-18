class CreateEstates < ActiveRecord::Migration[5.1]
  def change
    create_table :estates do |t|
      t.string :name
      t.string :web
      t.string :address
      t.string :phone_1
      t.string :phone_2
      t.string :state
      t.references :commune, foreign_key: true
      t.references :software, foreign_key: true

      t.timestamps
    end
  end
end
