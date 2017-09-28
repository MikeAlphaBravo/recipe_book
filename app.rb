require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

Recipe.create({:name => 'test recipe'})
Ingredient.create({:item => 'butter'})
Tag.create({:category => 'italian'})

get('/')do
  @tags = Tag.all
  @recipes = Recipe.all
  @ingredients = Ingredient.all
  erb(:index)
end

get('/category/create') do
  @recipes = Recipe.all
  erb(:create_category)
end

# post('/category/create') do
#   recipe_ids = params['recipe_ids']
#   Tag.new({:recipe_ids => recipe_ids})
#   binding.pry
#   redirect('/categories')
# end

get('/recipe/create') do
  @tags = Tag.all
  @ingredients = Ingredient.all
  erb(:create_recipe)
end

get('/ingredient/create') do
  @recipes = Recipe.all
  erb(:create_ingredient)
end

get('/categories') do
  @tags = Tag.all
  erb(:categories)
end

get('/recipes') do
  @recipes = Recipe.all
  erb(:recipes)
end

get('/ingredients') do
  @ingredients = Ingredient.all
  erb(:ingredients)
end
