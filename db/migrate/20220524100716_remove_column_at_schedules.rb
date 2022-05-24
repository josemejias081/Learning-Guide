class RemoveColumnAtSchedules < ActiveRecord::Migration[6.1]
  def change
    remove_column :schedules, :day, :string
  end
end
