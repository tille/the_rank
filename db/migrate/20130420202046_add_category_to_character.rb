class AddCategoryToCharacter < ActiveRecord::Migration
  def change
    add_column :characters, :category_id, :integer
  end
end
