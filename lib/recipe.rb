class Recipe < ActiveRecord::Base
  has_many :ingredients
  has_many :tags, through: :pages
  validates(:name, :presence => true)
  before_save(:titlecase_name)

private
  def titlecase_name
    self.name=(name.titlecase)
  end
end
