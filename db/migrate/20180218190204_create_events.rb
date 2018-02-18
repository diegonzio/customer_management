class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.text :title
      t.datetime :date_range
      t.datetime :start
      t.datetime :end
      t.string :color

      t.timestamps
    end
  end
end
