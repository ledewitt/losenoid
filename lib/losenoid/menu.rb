module Losenoid
  class Menu < ActiveRecord::Base
    
    validates_uniqueness_of :week
    
    validates_presence_of :sunday_main,
                          :sunday_side,
                          :monday_main,
                          :monday_side,
                          :tuesday_main,
                          :tuesday_side,
                          :wednesday_main,
                          :wednesday_side,
                          :thursday_main,
                          :thursday_side,
                          :friday_main,
                          :friday_side,
                          :saturday_main,
                          :saturday_side
    
    attr_accessible :week,
                    :sunday_main,
                    :sunday_side,
                    :monday_main,
                    :monday_side,
                    :tuesday_main,
                    :tuesday_side,
                    :wednesday_main,
                    :wednesday_side,
                    :thursday_main,
                    :thursday_side,
                    :friday_main,
                    :friday_side,
                    :saturday_main,
                    :saturday_side
    
  end
end