require          'bundler/setup'
require          'sinatra'
require_relative 'config/database'
require_relative 'lib/losenoid'
require          'json'

List = Losenoid::FoodItem.find(:all)

get("/") {
  food_item = List.sample
  
  erb :home, locals: { food_item: food_item }
}

get("/list") {
  
  erb :list, locals: { list: List }
}

get("/add_food_item") {
  erb :add_food_item
}

post("/add_food_item") {
  food_item = params[:food_item]
  
  Losenoid::FoodItem.create(name:           food_item.name,
                            plate_position: food_item.plate_position,
                            score:          food_item.score)
                            
  redirect "/add_food_item"
}