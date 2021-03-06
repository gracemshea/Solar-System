

class SolarSystem
  attr_reader :solar_system_name, :planets

  def initialize(solar_system_name)
    @solar_system_name = solar_system_name
    @planets = []
  end

  def add_planet(new_planet)
    @planets << new_planet
  end

  def get_info_new_planet
    print "\nWhat is your new Planet's name?"
    planet_name = gets.chomp.to_s
    print "\nWhat is #{planet_name}'s color?"
    color = gets.chomp.to_s
    print "\nWhat is the distance of planet from #{solar_system_name}(km): "
    distance = gets.chomp.to_f
    print "\nMass of #{planet_name}(kg): "
    mass = gets.chomp.to_f
    print "\nInteresting fact about #{planet_name}: "
    fun_fact = gets.chomp.to_s
    print "\nPlease rate the planet's twang on a scale of 0-5.0 #{planet_name}: "
    twang_level = gets.chomp.to_f

    new_planet = Planet.new(planet_name, color, distance, mass, fun_fact, twang_level)

    add_planet(new_planet)
    print "\nGenerating new data"
  end

  def list_planets
    list = "\nPlanets in the Country Music Universe:\n"
    @planets.each_with_index do |planet, index|
      index += 1
      list += "#{index}. #{planet.name}\n"
    end
    return list
  end

  def find_planet_by_name(planet_name)
    @planets.each do |planet|
      if planet.name == planet_name.capitalize
        return planet
      end
    end
    raise ArgumentError, "Planet does not exist in the Country Music Hall of Planets"
  end

  def get_planet_name
    print "\nEnter planet name: "
    planet = gets.chomp.to_s
    return find_planet_by_name(planet)
  end

  def get_planet_distance(name)
    @planets.each do |planet|
      if planet.name == name.capitalize
        return planet.distance
      end
    end
    raise ArgumentError, "Planet does not exist in the Country Music Hall of Planets"
  end

  def find_distance_between
    planet1 = get_planet_name
    planet2 = get_planet_name
    distance = (planet1.distance_from_sun_km) - (planet2.distance_from_sun_km)
    puts "\nDistance between #{planet1.name} and #{planet2.name}: #{distance.abs} km."
  end
end
