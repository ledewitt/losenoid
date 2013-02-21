require          'bundler/setup'
require          'sinatra'
require_relative 'config/database'
require_relative 'lib/losenoid'
require          'json'
require          'date'

helpers do
  def list
    @list    ||= Losenoid::FoodItem.find(:all)
  end
  
  def centers
    @centers ||= Losenoid::FoodItem.centers
  end
  
  def sides
    @sides   ||= Losenoid::FoodItem.sides
  end
end

get("/") {
  food_item = list.sample
  
  erb :home, locals: { food_item: food_item }
}

get("/list") {
  erb :list, locals: { list: list }
}

get("/menu") {
  erb :menu, locals: { centers: centers,
                       sides:   sides,
                       days:    Date::DAYNAMES }
}

# Below is place holder for the static menu table

get("/menu2") {
  erb :menu2, locals: { list: list,
                        days: Date::DAYNAMES }
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