class AddActivityTypeToEvents < ActiveRecord::Migration[5.1]
  def change
    add_reference :events, :activity_type, foreign_key: true
  end
end
