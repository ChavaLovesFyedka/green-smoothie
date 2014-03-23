# Parser class
#   when run, open the HTML link for the recipe site
#   find the css/html selectors that contain appropriate data
#   assign that data to attributes of new Smoothie class
#     eg. Banana Milkshake
#       -> Smoothie.new(:name => <css selector>, :description => <css selector>, :ingredients => <array of ingredients passed in via <css selector>.each method)

# the parser method, I think you'd want to encapsulate that logic as a model. When the class is initialized, it should save the data into a new Smoothie object, etc. you are not committing anything from the Parser class itself into the database, but you're using the Parser class to save data into an instance of a Smoothie class, etc.

# SQL class 
#   -> look into ActiveRecord for this; this is default when using Rails. MUCH easier than creating manual SQL statements. Don't create your own sql class, use built in rails functionality


require 'nokogiri'
require 'open-uri'
require 'sqlite3'
require 'pry'

class RecipeParser

  Recipes_URL = "http://www.incrediblesmoothies.com/green-smoothie-recipes/"

  def self.scrape
    letter_array = ("a".."z").to_a
    letter_array.each do |letter|
      page = Nokogiri::HTML(open("http://www.incrediblesmoothies.com/green-smoothie-recipes/"))
      find_symptom_names(page)
    end
  end

  def self.find_recipe_names(page)
    page.css('div.entrybody strong').each do |recipe_object|
      recipe_name = recipe_object.css('a').text #don't need 'a'?
      add_recipe(recipe_name)
    end
  end

  def self.add_recipe(recipe_name)
    if recipe_name.include? "("
      normalize_and_add_recipes(recipe_name)
    else
      Recipe.find_or_create_by(:name => recipe_name)
    end
  end

  def self.normalize_and_add_recipes(recipe_name)
    recipes_array = recipe_name.split(/\(|\)/)
    recipes_array.each do |recipe|
      Recipe.find_or_create_by(:name => recipe)
    end
  end
end





# class Parser
#   attr_accessor :title, :description

#   def initialize(str)
#     @doc = Nokogiri::HTML(open(str))
#   end

#   def parser
#     self.get_title
#     self.get_description
#   end

#   def get_title
#     if @doc.css("h1")
#       @title = @doc.css("h1").inner_text
#     end
#     puts @title
#   end

#   def get_description
#     if @doc.css("p:first")
#       @description = @doc.css("p:first").inner_text
#     end
#   end
# end


# # class Sql
# #   attr_accessor :title, :description

# #   @@db = SQLite3::Database.new('smoothies.db')

# #   def initialize(title, description)
# #     @title = title
# #     @description = description
# #   end

# #   def self.create_table
# #     puts "+ creating smoothies table +"
# #     @@db.execute("CREATE TABLE IF NOT EXISTS smoothies ( ID INTEGER PRIMARY KEY, title TEXT, description TEXT)")
# #   end

# #   def sql_save
# #     puts "+ inserting into smoothies table +"
# #     @@db.execute("INSERT INTO smoothies (title, description) VALUES (?, ?)", [@title, @description])
# #   end
# # end


# # Sql.create_table
# # smoothies = Smoothie.grab_smoothies