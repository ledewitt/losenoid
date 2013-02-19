module Losenoid
  class User < ActiveRecord::Base
    
    validates_presence_of   :user_naem
    validates_format_of     :user_name, with: /\A[-A-Za-z0-9_]+\z/
    validates_uniqueness_of :user_name
    
    has_one :menu
    
    attr_accessible :user_name
  end
end