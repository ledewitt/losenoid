module Losenoid
  class FoodItem < ActiveRecord::Base
    
    validates_presence_of :name, :plate_position, :score
    
    attr_accessible :name,
                    :plate_position,
                    :score
                    
    scope :centers, where("plate_position = 'center'")
    scope :sides, where("plate_position = 'side'")
    
  end
end