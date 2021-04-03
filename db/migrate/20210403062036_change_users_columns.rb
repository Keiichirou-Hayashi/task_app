class ChangeUsersColumns < ActiveRecord::Migration[6.1]
  def change
    change_column :tasks, :start_day, :date
    change_column :tasks, :end_day, :date
  end
end
