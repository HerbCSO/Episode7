require_relative "../lib/sales_person"
require_relative "../lib/calculates_route"

describe SalesPerson do
	it "should have many cities" do
		city = stub
		subject.schedule_city(city)
		subject.cities.should include(city)
	end

	it "should keep the cities only scheduled once" do	
		city = stub
		expect{
			subject.schedule_city(city)
			subject.schedule_city(city)
		}.to change(subject.cities,:count).by(1) 			
	end

	it "should calculate a route via the CalculatesRoute" do
		cities = [stub, stub, stub]
		start = stub
		subject.stub(:cities) { cities } 
		CalculatesRoute.should_receive(:calculate).with(cities, start)
		subject.route(start)
	end
	it "should return the route from CalculatesRoute" do
		route_stub = [stub, stub]
		CalculatesRoute.stub(:calculate) { route_stub }
		subject.route(stub).should eq(route_stub)
	end
end
