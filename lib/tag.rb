class Tag < ActiveRecord::Base
  has_many :recipes, through: :pages
end
