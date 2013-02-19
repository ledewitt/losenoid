require          'bundler/setup'
require          'sinatra'
require_relative 'config/database'
require_relative 'lib/losenoid'
require          'json'

get("/") {
  food_item = Losenoid::FoodItem.find_by_name("Grilled Chicken")
  
  erb :home, locals: { food_item: food_item }
}