class Trainer < ActiveRecord::Base
    has_many :pokemon
    belongs_to :user
    
end