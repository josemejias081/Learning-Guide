class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.string :day
      t.date :date
      t.string :event
      t.string :description
      t.string :note

      t.timestamps
    end
  end
end
