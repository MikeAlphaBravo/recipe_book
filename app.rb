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

get('/recipe/create') do
  erb(:create_recipe)
end

get('/ingredient/create') do
  erb(:create_ingredient)
end
