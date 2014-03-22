class AilmentRecipe < ActiveRecord::Base
	belongs_to :recipe 
	belongs_to :ailment 
end
