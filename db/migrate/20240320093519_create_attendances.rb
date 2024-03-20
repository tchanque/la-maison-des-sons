class CreateAttendances < ActiveRecord::Migration[7.1]
  def change
    create_table :attendances do |t|
      t.belongs_to :attendee, foreign_key: { to_table: :users }
      t.belongs_to :event
      t.timestamps
    end
  end
end
