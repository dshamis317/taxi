# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

f = File.new('../../../Desktop/taxi-data/intersections-taxi-data.jl')
f.each_line do |line|
  line = JSON.parse(line)
  intersection = Intersection.create({
    osm: line['osm'].to_i,
    pickups: line['pickups'],
    dropoffs: line['dropoffs'],
    latitude: line['geo']['coordinates'][0],
    longitude: line['geo']['coordinates'][1],
    })
  line['streets'].each do |street|
    Street.create({name: street, intersection_osm: intersection.osm})
  end
  empty = line['passEmptiesH']
  empty_keys = empty.keys.sort
  empty_keys.each do |hour|
    Empty.create({
      time: hour + ':00',
      total: empty[hour],
      intersection_osm: intersection.osm
      })
  end
end
