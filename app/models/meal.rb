class Meal < ActiveRecord::Base
	validates_presence_of :name, :location, :time
end
