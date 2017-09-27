class RemoveRecipeIdColumnFromTagTable < ActiveRecord::Migration[5.1]
  def change
    remove_column(:tags, :recipe_id, :integer)
  end
end
