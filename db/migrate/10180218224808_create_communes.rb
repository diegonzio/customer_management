class CreateCommunes < ActiveRecord::Migration[5.1]
  def change
    create_table :communes do |t|
      t.string :name
      t.string :region_id

      t.timestamps
    end
  end
end
