Dir["./lib/*.rb"].each {|file| require file }
require 'yaml'

carsten = SalesPerson.new
va_cities = ["Virginia Beach", "Norfolk", "Chesapeake", "Richmond", "Arlington", "Newport News", "Hampton", "Alexandria", "Portsmouth", "Roanoke", "Lynchburg", "Suffolk", "Burke", "Reston", "Dale City", "Annandale", "Centreville", "Danville", "Charlottesville", "Tuckahoe", "Chantilly", "Harrisonburg", "Blacksburg", "McLean", "Manassas", "Petersburg", "Franconia", "Woodbridge", "Lake Ridge", "Mechanicsville", "Springfield", "Oakton", "West Springfield", "Mount Vernon", "Leesburg", "Jefferson", "Cave Spring", "Salem", "Staunton", "Winchester", "Bailey's Crossroads", "Hopewell", "Herndon", "Fairfax", "Abingdon", "Alexandria", "Annandale", "Aquia Harbour", "Arlington", "Ashland", "Bailey's Crossroads", "Bedford", "Belle Haven", "Bellwood", "Blacksburg", "Bon Air", "Bristol", "Buena Vista", "Bull Run", "Burke", "Cave Spring", "Centreville", "Chantilly", "Charlottesville", "Chesapeake", "Chester", "Christiansburg", "Collinsville", "Colonial Heights", "Covington", "Culpeper", "Dale City", "Danville", "Dumbarton", "Dumfries", "Dunn Loring", "East Highland Park", "Fairfax", "Falls Church", "Farmville", "Forest", "Fort Belvoir", "Fort Hunt", "Fort Lee", "Franconia", "Franklin", "Fredericksburg", "Front Royal", "Galax", "Glen Allen", "Gloucester Point", "Great Falls", "Groveton", "Hampton", "Harrisonburg", "Herndon", "Highland Springs", "Hollins", "Hopewell", "Huntington", "Hybla Valley", "Idylwood", "Jefferson", "Lake Barcroft", "Lake Monticello", "Lake Ridge", "Lakeside", "Laurel", "Leesburg", "Lexington", "Lincolnia", "Linton Hall", "Lorton", "Lynchburg", "Madison Heights", "Manassas", "Manassas Park", "Mantua", "Marion", "Martinsville", "McLean", "Mechanicsville", "Merrifield", "Montclair", "Montrose", "Mount Vernon", "Newington", "Newport News", "Norfolk", "North Springfield", "Oakton", "Orange", "Petersburg", "Pimmit Hills", "Poquoson", "Portsmouth", "Pulaski", "Quantico Station", "Radford", "Reston", "Richmond", "Roanoke", "Rose Hill", "Salem", "Seven Corners", "Smithfield", "South Boston", "Springfield", "Staunton", "Stuarts Draft", "Sudley", "Suffolk", "Timberlake", "Tuckahoe", "Tysons Corner", "Vienna", "Vinton", "Virginia Beach", "Warrenton", "Waynesboro", "West Gate", "West Springfield", "Williamsburg", "Winchester", "Wolf Trap", "Woodbridge", "Wyndham", "Wytheville", "Yorkshire"] 
md_cities = ["Aberdeen", "Accident", "Annapolis", "Baltimore", "Barclay", "Barnesville", "Barton", "Bel Air", "Berlin", "Berwyn Heights", "Betterton", "Bladensburg", "Boonsboro", "Bowie", "Brentwood", "Brookeville", "Brookview", "Brunswick", "Burkittsville", "Cambridge", "Capitol Heights", "Cecilton", "Centreville", "Charlestown", "Chesapeake Beach", "Chesapeake City", "Chestertown", "Cheverly", "Chevy Chase, Town of", "Chevy Chase, Village of, Section 3", "Chevy Chase, Village of, Section 5", "Chevy Chase View", "Chevy Chase Village", "Church Creek", "Church Hill", "Clear Spring", "College Park", "Colmar Manor", "Cottage City", "Crisfield", "Cumberland", "Deer Park", "Delmar", "Denton", "District Heights", "Eagle Harbor", "East New Market", "Easton", "Edmonston", "Eldorado", "Elkton", "Emmitsburg", "Fairmount Heights", "Federalsburg", "Forest Heights", "Frederick", "Friendsville", "Frostburg", "Fruitland", "Funkstown", "Gaithersburg", "Galena", "Galestown", "Garrett Park", "Glen Echo", "Glenarden", "Goldsboro", "Grantsville", "Indian Head", "Keedysville", "Kensington", "Kitzmiller", "La Plata", "Landover Hills", "Laurel", "Laytonsville", "Leonardtown", "Loch Lynn Heights", "Lonaconing", "Luke", "Manchester", "Mardela Springs", "Martin's Additions", "Marydel", "Middletown", "Midland", "Millington", "Morningside", "Mount Airy", "Mount Rainier", "Mountain Lake Park", "Myersville", "New Carrollton", "New Market", "New Windsor", "North Beach", "North Brentwood", "North Chevy Chase", "North East", "Oakland", "Ocean City", "Oxford", "Perryville", "Pittsville", "Pocomoke City", "Poolesville", "Port Deposit", "Port Tobacco", "Preston", "Princess Anne", "Queen Anne", "Queenstown", "Ridgely", "Rising Sun", "Riverdale Park", "Rock Hall", "Rockville", "Rosemont", "St. Michaels", "Salisbury", "Seat Pleasant", "Secretary", "Sharpsburg", "Sharptown", "Smithsburg", "Snow Hill", "Somerset", "Sudlersville", "Sykesville", "Takoma Park", "Taneytown", "Templeville", "Thurmont", "Trappe", "Walkersville", "Washington Grove", "Westernport", "Westminster", "Willards", "Williamsport", "Woodsboro"] 
all_cities = va_cities.map {|c| "#{c}, VA"}.zip(md_cities.map{|c| "#{c}, MD"}).flatten.compact
all_cities.each do |city|
  carsten.schedule_city(Place.build("#{city}"))
  sleep(0.25)
  puts city
end
File.open("cities.yml", "w") do |file|
  file.puts YAML::dump(carsten)
end
