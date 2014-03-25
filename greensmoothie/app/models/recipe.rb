class Recipe < ActiveRecord::Base
	has_many :ailment_recipes
	has_many :ailments, through: :ailment_recipes

  # def self.normalize_recipes
  #   Recipe.all.each do |recipe|
  #     if recipe.name.include? ","
  #       normalized_recipe = recipe.name.split(",").reverse.join("").strip
  #       Recipe.find_by(:name => recipe.name).update(:name => normalized_recipe)
  #     end
  #   end
  # end

  # def self.set_actives
  #   Recipe.all.each do |recipe|
  #     @search = Ailment.search do
  #       fulltext "\"#{recipe.name}\"" do
  #         minimum_match 1
  #       end
  #     end

  #     if @search.results.size > 0
  #       recipe.active = true
  #     else
  #       recipe.active = false
  #     end

  #     recipe.save
  #   end
  # end

  # def self.active
  #   Recipe.where(:active => true)
  # end

  # def self.strip_recipes
  #   Recipe.all.each do |recipe|
  #     stripped_name = recipe.name.strip
  #     recipe.update(:name => stripped_name)
  #   end
  # end

  # def self.dedupe
  #   grouped = Recipe.all.group_by{|recipe| [recipe.name] }
  #   grouped.values.each do |duplicates|
  #     first_one = duplicates.shift
  #     duplicates.each{|double| double.destroy}
  #   end
  # end

  # def self.add_recipe(*recipes)
  #   recipes.each do |recipe|
  #     Recipe.find_or_create_by(:name => recipe.titleize, :active => true)
    #end
  #end
end
