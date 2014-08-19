class MapsController < ApplicationController
  def index
  end

  def locations
    latitude = params[:latitude]
    longitude = params[:longitude]
    nearby_intersections = Intersection.query_intersections(latitude, longitude)
    sorted_intersection_array = Intersection.sort_intersections_by_empty(nearby_intersections)
    address_array = Intersection.sort_intersections(sorted_intersection_array)

    addresses = {
      center: {latitude: latitude, longitude: longitude},
      markers: address_array
    }

    render :json => addresses.to_json
  end
end
