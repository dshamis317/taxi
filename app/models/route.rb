class Route < ActiveRecord::Base
  belongs_to :drive
  has_many :intersections
end
