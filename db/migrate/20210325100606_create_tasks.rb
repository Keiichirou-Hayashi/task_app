class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.datetime :start_day
      t.datetime :end_day
      t.string :all_day

      t.timestamps
    end
  end
end
