class Drive < ActiveRecord::Base
  belongs_to :shift
  has_one :route
  has_many :intersections, through: :route
end
