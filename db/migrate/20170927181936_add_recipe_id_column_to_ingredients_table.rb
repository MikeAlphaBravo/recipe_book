class AddRecipeIdColumnToIngredientsTable < ActiveRecord::Migration[5.1]
  def change
    add_column(:ingredients, :recipe_id, :integer)
  end
end
