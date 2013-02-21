require          'bundler/setup'
require          'sinatra'
require_relative 'config/database'
require_relative 'lib/losenoid'
require          'json'

list = Losenoid::FoodItem.find(:all)
Days_of_the_Week = [ "Monday",
                     "Tuesday",
                     "Wednesday",
                     "Thursday",
                     "Friday",
                     "Saturday",
                     "Sunday" ]

get("/") {
  food_item = list.sample
  
  erb :home, locals: { food_item: food_item }
}

get("/list") {
  
  erb :list, locals: { list: list }
}

get("/menu") {
  erb :menu, locals: { list: list,
                       Days_of_the_Week: Days_of_the_Week }
}

# Below is place holder for the static menu table

get("/menu2") {
  erb :menu2, locals: { list: list,
                       Days_of_the_Week: Days_of_the_Week }
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