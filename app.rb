require("bundler/setup")
require('pry')
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
##########################################################################
get('/category/create') do
  @recipes = Recipe.all
  erb(:create_category)
end

post('/category/create') do
  recipe_ids = params['recipe_ids']
  Tag.new({:recipe_ids => recipe_ids})
  binding.pry
  redirect('/categories')
end

get ('/category/delete/:id') do
  Tag.find(params['id']).destroy
  redirect('/categories')
end

# get('/category/edit/:id') do
#   Tag.find(params['id'])
#   erb(:)
# end
##########################################################################
get('/recipe/create') do
  @tags = Tag.all
  @ingredients = Ingredient.all
  erb(:create_recipe)
end

post('/recipe/create') do
  tag_ids = params['tag_ids']
  name = params['name']
  Recipe.create({:name => name, :tag_ids => tag_ids})
  binding.pry
  redirect('/recipes')
end

get ('/recipe/delete/:id') do
  Recipe.find(params['id']).destroy
  redirect('/recipes')
end
##########################################################################
get('/ingredient/create') do
  @recipes = Recipe.all
  erb(:create_ingredient)
end

post('/ingredient/create') do
  item = params['item']
  recipe_ids = params['recipe_ids']
  Ingredient.create({:item => item, :recipe_ids => recipe_ids})
  redirect('/ingredients')
end

get ('/ingredient/delete/:id') do
  Ingredient.find(params['id']).destroy
  redirect('/ingredients')
end
##########################################################################
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
