class Ingredient < ActiveRecord::Base
  has_many :foods
  has_many :recipes, through: :foods
  validates(:item, :presence => true)
  validates(:item, uniqueness: { case_sensitive: false })
end
