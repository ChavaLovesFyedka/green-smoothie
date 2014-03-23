# Smoothie class
#   parameters -> name (string from nokogiri, description (string from Nokogiri), ingredients (array)

require 'nokogiri'
require 'open-uri'
require 'sqlite3'
require 'pry'


class Smoothie
  attr_accessor :title, :description

  def self.create_smoothies
    self.grab_smoothies.collect do |str|
      begin
        Smoothie.new(str)
        sleep 1
      rescue
        next
      end
    end
  end

  def self.grab_smoothies
      # page = File.read("http://www.incrediblesmoothies.com/recipes/pineapple-smoothie-recipes-and-nutrition/")
    page = Nokogiri::HTML(open("http://www.incrediblesmoothies.com/recipes/pineapple-smoothie-recipes-and-nutrition/"))
      # page = "http://www.incrediblesmoothies.com/recipes/pineapple-smoothie-recipes-and-nutrition/"
      # index_url = page + "/wiki/List_of_Presidents_of_the_United_States"
    smoothies_doc = Nokogiri::HTML(page)
    
    smoothies_collection = {}
      # index_doc = Nokogiri::HTML(open(index_url))
      # president_anchors = index_doc.css("table.wikitable td b a")
      # president_anchors.map {|a| wiki_page + a.attr('href')}
    page.css('div.entrybody').text.each do |smoothie|
    title = smoothie.css('div.entrybody strong').text.to_sym
    smoothie[title] = {
      :description => smoothie.css('div.entrybody p').text
    }
    binding.pry
  end

end