class CreateTheJoinTableIngredientsRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table(:foods) do |t|
      t.column(:recipe_id, :integer)
      t.column(:ingredient_id, :integer)

      t.timestamps()
    end
    remove_column(:recipes, :ingredient_id, :integer)
    remove_column(:ingredients, :recipe_id, :integer)
  end
end
