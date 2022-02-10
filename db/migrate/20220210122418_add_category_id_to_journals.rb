class AddCategoryIdToJournals < ActiveRecord::Migration[6.1]
  def change
    add_column :journals, :category_id, :integer
  end
end
