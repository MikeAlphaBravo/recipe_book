require('spec_helper')

describe(Recipe) do
  it("has many ingredients") do
    recipe = Recipe.create({:name => "recipe"})
    ingredient1 = Ingredient.create({:item => "ingredient1", :recipe_id => recipe.id})
    ingredient2 = Ingredient.create({:item => "ingredient2", :recipe_id => recipe.id})
    expect(recipe.ingredients()).to(eq([ingredient1, ingredient2]))
  end
  it("has many tags") do
    recipe = Recipe.create({:name => "recipe"})
    tag1 = Tag.create({:category => "tag1", :recipe_id => recipe.id})
    tag2 = Tag.create({:category => "tag2", :recipe_id => recipe.id})
    expect(recipe.tags()).to(eq([tag1, tag2]))
  end



end
