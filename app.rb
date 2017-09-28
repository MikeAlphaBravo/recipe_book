require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }



get('/')do
  @tags = Tag.all
  @recipes = Recipe.all
  @ingredients = Ingredient.all
  erb(:index)
end

get('/category/create') do
  erb(:create_category)
end

# post('/category/create') do
#   recipe_ids = params['recipe_ids']
#   Tag.create({:recipe_ids =>recipe_ids})
#   binding.pry
#   redirect('/categories')
# end

get('/recipe/create') do
  erb(:create_recipe)
end

get('/ingredient/create') do
  erb(:create_ingredient)
end
