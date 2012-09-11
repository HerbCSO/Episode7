class CalculatesRoute

	def self.calculate(points, start)

		remaining_points = Array.new(points)
		route = []
		total_distance = 0
		route << remaining_points.slice!(remaining_points.index(start))
		until remaining_points == [] do 
			next_point_and_dist = shortest_distance(route.last, remaining_points)
			next_point = next_point_and_dist.fetch(:point)
			total_distance += next_point_and_dist.fetch(:distance)
			route << remaining_points.slice!(remaining_points.index(next_point))
		end
		{route: route, total_distance: total_distance, traveling_time: total_distance / 55}
	end

	def self.shortest_distance(from, possible)
		distances = possible.map do |point|
			{point: point, distance: Map.distance_between(from, point)}
		end
		distances.sort{|a,b| a.fetch(:distance) <=> b.fetch(:distance)}.first
	end

end

