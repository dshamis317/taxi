class Street < ActiveRecord::Base
  has_and_belongs_to_many :intersections

  API_KEY = ENV.fetch('GOOGLE_TAXI')

  def self.get_address(latitude, longitude)
    url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng='
    query = "#{latitude},#{longitude}&key=#{API_KEY}"
    data = HTTParty.get(url + query)
    return data['results'][0]['formatted_address']
  end
end
