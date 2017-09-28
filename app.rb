require("bundler/setup")
require('pry')
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

# Recipe.create({:name => 'test recipe'})
# Ingredient.create({:item => 'butter'})
# Tag.create({:category => 'italian'})

get('/')do
  @tags = Tag.all
  @recipes = Recipe.all
  @ingredients = Ingredient.all
  erb(:index)
end
#Category#########################################################################
get('/category/create') do
  @recipes = Recipe.all
  erb(:create_category)
end

post('/category/create') do
  recipe_ids = params['recipe_ids']
  category = params['category']
  Tag.create({:recipe_ids => recipe_ids, :category => category})
  redirect('/categories')
end

get('/category/delete/:id') do
  Tag.find(params['id']).destroy
  redirect('/categories')
end

# get('/category/edit/:id') do
#   Tag.find(params['id'])
#   erb(:)
# end

get('/category/:id') do
  @tag = Tag.find(params['id'])
  erb(:category)
end

get('/categories') do
  @tags = Tag.all
  erb(:categories)
end

#Recipe#########################################################################
get('/recipe/create') do
  @tags = Tag.all
  @ingredients = Ingredient.all
  erb(:create_recipe)
end

post('/recipe/create') do
  tag_ids = params['tag_ids']
  ingredient_ids = params['ingredient_ids']
  name = params['name']
  if Recipe.create({:name => name, :tag_ids => tag_ids, :ingredient_ids => ingredient_ids}).id
    redirect('/recipes')
  else
    @not_saved = true
    @tags = Tag.all
    @ingredients = Ingredient.all
    erb(:create_recipe)
  end
end

get ('/recipe/delete/:id') do
  Recipe.find(params['id']).destroy
  redirect('/recipes')
end

get('/recipe/:id') do
  @recipe = Recipe.find(params['id'])
  erb(:recipe)
end

post('/search') do
  search = params['search']
  result = Recipe.where("name ILIKE ?", "%#{params['search']}%")
  if result[0]
    redirect("/recipe/#{result[0].id}")
  else
    redirect('/')
  end
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

get('/ingredient/:id') do
  @ingredient = Ingredient.find(params['id'])
  erb(:ingredient)
end
##########################################################################

get('/recipes') do
  @recipes = Recipe.all
  erb(:recipes)
end

get('/ingredients') do
  @ingredients = Ingredient.all
  erb(:ingredients)
end
