module Losenoid
  class Menu < ActiveRecord::Base
    
    validates_presence_of :main, :side
    
    has_one :score
    
    attr_accessible :main, :side
    
  end
end