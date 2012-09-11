Dir["./lib/*.rb"].each {|file| require file }
require 'yaml'
require 'benchmark'

carsten = SalesPerson.new
File.open("cities.yml", "r") do |file|
  carsten = YAML::load(file)
end

start = Place.build("Richmond, VA")

def run_bm(x, sales_person, start)
  sales_person.schedule_city(start)
  puts "Num. cities #{format('%3s', sales_person.cities.count)}: "
  route = nil
  x.report { route = sales_person.route(start) }
  puts "Total distance: #{format('%8.2f', route.fetch(:total_distance))} - Traveling time: #{format('%8.2f', route.fetch(:traveling_time))} hours"
end

Benchmark.bm do |x|
  run_bm(x, carsten, start)
  carsten.cities.slice!(0,66)
  run_bm(x, carsten, start)
  carsten.cities.slice!(0,100)
  run_bm(x, carsten, start)
  carsten.cities.slice!(0,50)
  run_bm(x, carsten, start)
  carsten.cities.slice!(0,40)
  run_bm(x, carsten, start)
  carsten.cities.slice!(0,8)
  run_bm(x, carsten, start)
end
