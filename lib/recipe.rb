class Recipe < ActiveRecord::Base
  has_many :pages
  has_many :foods
  has_many :tags, through: :pages
  has_many :ingredients, through: :foods

  validates(:name, :presence => true)
  before_save(:titlecase_name)

private
  def titlecase_name
    self.name=(name.titlecase)
  end
end
