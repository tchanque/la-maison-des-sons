class AddMaxSeatsToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :max_seats, :integer
  end
end
