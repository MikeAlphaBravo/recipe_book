class Tag < ActiveRecord::Base
  has_many :pages
  has_many :recipes, through: :pages
  validates(:category, :presence => true)
  validates(:category, uniqueness: { case_sensitive: false })
end
