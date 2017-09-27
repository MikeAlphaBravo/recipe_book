class CreatePagesTable < ActiveRecord::Migration[5.1]
  def change
    create_table(:pages) do |t|
      t.column(:recipe_id, :integer)
      t.column(:tag_id, :integer)

      t.timestamps()
    end
  end
end
