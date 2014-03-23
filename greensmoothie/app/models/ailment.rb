class Ailment < ActiveRecord::Base
	has_many :ailment_recipes
	has_many :recipes, through: :ailment_recipes

	def name
		"#{name}"
	end
end
