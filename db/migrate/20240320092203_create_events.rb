class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.belongs_to :creator, foreign_key: { to_table: :users }
      t.string :category
      t.string :instrument
      t.integer :level
      t.integer :price
      t.datetime :start_date
      t.integer :duration
      t.text :description
      t.string :location
      t.integer :available_seats

      t.timestamps
    end
  end
end
