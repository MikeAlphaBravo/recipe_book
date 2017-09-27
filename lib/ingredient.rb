class Ingredient < ActiveRecord::Base
  belongs_to :recipe
  has_many :recipes
  validates(:item, :presence => true)
end
