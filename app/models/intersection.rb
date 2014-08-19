class Intersection < ActiveRecord::Base
  self.primary_key = :osm
  acts_as_mappable :lat_column_name => :latitude,
                   :lng_column_name => :longitude
  has_and_belongs_to_many :streets
  has_many :empties

  def self.query_intersections(latitude, longitude)
    return Intersection.within(0.1, :origin => [latitude, longitude]).limit(8).pluck(:osm)
  end

  def self.sort_intersections_by_empty(osm_array)
    empties = osm_array.map do |osm|
      Empty.where('intersection_osm = ?', osm)
    end
    current_hour = Time.now.hour.to_s + ':00'
    empty_cab_hash = {}
    empties.each do |empty|
      empty.each do |cab|
        if cab.time == current_hour
          empty_cab_hash[cab.intersection_osm] = cab.total
        end
      end
    end
    return empty_cab_hash.sort_by {|k,v| -v}
  end

  def self.sort_intersections(array)
    array.map do |osm, empty_cabs|
      intersection = Intersection.find(osm)
      [{latitude: intersection.latitude, longitude: intersection.longitude}, empty_cabs]
    end
  end
end
