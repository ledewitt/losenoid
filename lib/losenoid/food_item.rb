module Losenoid
  class FoodItem < ActiveRecord::Base
    
    validates_presence_of :name
    validates_presence_of :plate_position
    validates_presence_of :score
    
    attr_accessible :name,
                    :plate_position,
                    :score
    
  end
end