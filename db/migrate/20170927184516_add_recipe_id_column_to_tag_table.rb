class AddRecipeIdColumnToTagTable < ActiveRecord::Migration[5.1]
  def change
    add_column(:tags, :recipe_id, :integer)
  end
end
