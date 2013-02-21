require          'bundler/setup'
require          'sinatra'
require_relative 'config/database'
require_relative 'lib/losenoid'
require          'json'

list = Losenoid::FoodItem.find(:all)

get("/") {
  food_item = list.sample
  
  erb :home, locals: { food_item: food_item }
}

get("/list") {
  
  erb :list, locals: { list: List }
}

get("/add_food_item") {
  erb :add_food_item
}

post("/add_food_item") {
  # new_food_item = params[:new_food_item]
  
  Losenoid::FoodItem.create(name:           params[:name],
                            plate_position: params[:plate_position],
                            score:          params[:score])

  list = Losenoid::FoodItem.find(:all)                          
  redirect "/add_food_item"
}