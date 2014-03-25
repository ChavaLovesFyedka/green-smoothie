# Parser class
#   when run, open the HTML link for the recipe site
#   find the css/html selectors that contain appropriate data
#   assign that data to attributes of new Smoothie class
#     eg. Banana Milkshake
#       -> Smoothie.new(:name => <css selector>, :description => <css selector>, :ingredients => <array of ingredients passed in via <css selector>.each method)
require 'nokogiri'
require 'open-uri'
require 'sqlite3'
require 'pry'


class RecipeParser

# nokogiri_doc.css('div.entry').text


  Recipes_URL = "http://trickortechrat.wordpress.com/2014/03/25/smoothie-list/"

  def self.scrape
    # letter_array = ("a".."z").to_a
    # letter_array.each do |letter|
      page = Nokogiri::HTML(open("http://trickortechrat.wordpress.com/2014/03/25/smoothie-list/"))
      find_recipe_names(page)
    end
  end
# assign data to description attribute > Smoothie.new(:name => <css selector>, :description => <css selector>, :ingredients => <array of ingredients passed in via <css selector>.each method)

  def self.find_recipe_names(page)
    page.css('div.entry strong').each do |recipe_object|
      recipe_name = recipe_object.css('a').text #don't need 'a'?
      puts recipe_objects[recipe_name] = {
      	:description => recipe_object.css('div.entry p').text
      }
      add_recipe(recipe_name)
    end
  end

  def self.add_recipe(recipe_name)
    # if recipe_name.include? "("
    #   normalize_and_add_recipes(recipe_name)
    # else
      Recipe.find_or_create_by(:name => recipe_name)
    # end
  end

  # def self.normalize_and_add_recipes(recipe_name)
  #   recipes_array = recipe_name.split(/\(|\)/)
  #   recipes_array.each do |recipe|
  #     Recipe.find_or_create_by(:name => recipe)
  #   end
  # end
end