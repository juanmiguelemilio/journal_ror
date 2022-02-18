class AddJournalIdToCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :journal_id, :integer
    add_foreign_key :journals, :categories
  end
end
