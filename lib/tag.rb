class Tag < ActiveRecord::Base
  has_many :recipes, through: :pages
  validates(:category, :presence => true)
end
