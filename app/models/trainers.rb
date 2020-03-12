class Trainer < ActiveRecord::Base
    has_many :pokemon
    belongs_to :user
    
  def self.valid_params?(params)
    return !params[:name].empty?
  end
end