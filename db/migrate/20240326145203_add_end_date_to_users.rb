class AddEndDateToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :end_date, :datetime
  end
end
