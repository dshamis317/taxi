class Intersection < ActiveRecord::Base
  has_and_belongs_to_many :streets
end