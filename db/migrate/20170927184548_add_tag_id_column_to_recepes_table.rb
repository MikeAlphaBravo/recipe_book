class AddTagIdColumnToRecepesTable < ActiveRecord::Migration[5.1]
  def change
    add_column(:recipes, :tag_id, :integer)
  end
end
