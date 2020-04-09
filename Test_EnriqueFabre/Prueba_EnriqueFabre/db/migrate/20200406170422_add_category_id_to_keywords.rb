class AddCategoryIdToKeywords < ActiveRecord::Migration[6.0]
  def change
    add_column :keywords, :category_id, :integer
    add_foreign_key :keywords, :categories
  end
end
