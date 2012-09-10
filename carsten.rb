Dir["./lib/*.rb"].each {|file| require file }


carsten = SalesPerson.new
washington = Place.build("Washington, DC")
carsten.schedule_city(Place.build("Alexandria, VA"))
carsten.schedule_city(washington)
carsten.schedule_city(Place.build("Arlington, VA"))
carsten.schedule_city(Place.build("Vienna, VA"))
carsten.schedule_city(Place.build("Purcellville, VA"))

puts carsten.route(washington)
