class Tag < ActiveRecord::Base
  has_many :recipes, through: :pages
  has_many :pages
  validates(:category, :presence => true)
end
