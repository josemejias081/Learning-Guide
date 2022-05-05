class RemoveColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :schedules, :description, :string
  end
end
