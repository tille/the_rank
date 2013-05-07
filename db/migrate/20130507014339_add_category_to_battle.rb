class AddCategoryToBattle < ActiveRecord::Migration
  def change
    add_column :battles, :category_id, :integer
  end
end
