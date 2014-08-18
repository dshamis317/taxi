class Intersection < ActiveRecord::Base
  self.primary_key = :osm
  has_and_belongs_to_many :streets
  has_many :empties
end
