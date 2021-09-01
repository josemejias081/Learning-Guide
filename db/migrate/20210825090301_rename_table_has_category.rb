class RenameTableHasCategory < ActiveRecord::Migration[6.1]
  def change
    rename_table :has_categories, :categories_topics
  end
end
