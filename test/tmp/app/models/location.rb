class Location < ActiveRecord::Base
  acts_as_position
  # attr_accessible :title, :body
end
