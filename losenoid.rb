require          'bundler/setup'
require          'sinatra'
require_relative 'config/database'
require_relative 'lib/losenoid'
require          'json'
require          'date'

helpers do
  def list
    @list    ||= Losenoid::FoodItem.all
  end
  
  def centers
    @centers ||= Losenoid::FoodItem.centers
  end
  
  def sides
    @sides   ||= Losenoid::FoodItem.sides
  end
  
  def menus
    @menus    ||= Losenoid::Menu.all
  end
end

get("/") {
  food_item = list.sample
  
  erb :home, locals: { food_item: food_item }
}

get("/list") {
  erb :list
}

get("/menu") {
  erb :menu, locals: { days: Date::DAYNAMES }
}

post("/menu") {  
  Losenoid::Menu.create(week:            DateTime::now.cweek,
                               sunday_main:      params[:sunday_main],
                               sunday_side:      params[:sunday_side],
                               monday_main:      params[:monday_main],
                               monday_side:      params[:monday_side],
                               tuesday_main:     params[:tuesday_main],
                               tuseday_side:     params[:tuesday_side],
                               wednesday_main:   params[:wednesday_main],
                               wednesday_side:   params[:wednesday_side],
                               thursday_main:    params[:thursday_main],
                               thursday_side:    params[:thursday_side],
                               friday_main:      params[:friday_main],
                               friday_side:      params[:friday_side],
                               saturday_main:    params[:saturday_main],
                               saturday_side:    params[:saturday_side])
                        
  # raise menu.errors.full_messages.inspect
                        
  redirect "/final_menu"
}

get("/final_menu") {
    erb :final_menu
  }
  
# Below is place holder for the static menu table

get("/menu2") {
  erb :menu2, locals: { days: Date::DAYNAMES }
}

get("/add_food_item") {
  erb :add_food_item
}

post("/add_food_item") {
  # new_food_item = params[:new_food_item]
  
  Losenoid::FoodItem.create(name:           params[:name],
                            plate_position: params[:plate_position],
                            score:          params[:score])
                        
  redirect "/add_food_item"
}