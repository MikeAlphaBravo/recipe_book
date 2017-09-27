class CreateRecipesTable < ActiveRecord::Migration[5.1]
  def change
    create_table(:recipes) do |t|
      t.column(:name, :string)
      t.column(:ingredient_id, :integer)
      t.column(:instructions, :string)
      t.column(:rating, :integer)

      t.timestamps()
    end
  end
end
