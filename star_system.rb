class StarSystem
  attr_reader :name, :planets

  def initialize(name,planets)
    @name=name
    @planets=planets
  end

   def planet_names
     expected_planets=[]
     @planets.each do |planet|
       expected_planets.push(planet.name)
     end
     return expected_planets
   end

   def get_planet_by_name(name)
     @planets.each do |planet|
      if  planet.name == name
        return planet
      end
     end
  end


  def get_largest_planet
    diameters= @planets.map {|planet|planet.diameter}

    largest_diameter=diameters.max
    @planets.each do |planet|
      if largest_diameter==planet.diameter
        return planet
      end
    end
  end

    def get_smallest_planet
      diameters= @planets.map {|planet|planet.diameter}
      smallest_diameter=diameters.min
      @planets.each do |planet|
        if smallest_diameter==planet.diameter
          return planet
        end
      end
    end

    def get_planets_with_no_moons
      planets_with_no_moons=[]
      @planets.each do |planet|
        if planet.number_of_moons==0
          planets_with_no_moons.push(planet)
        end
      end
      return planets_with_no_moons
    end


    def get_planets_with_more_moons(number_of_moons)
      planets_with_more_than_4_moons=[]
      @planets.each do |planet|
        if planet.number_of_moons>4
        planets_with_more_than_4_moons.push(planet.name)
        end
      end
      return planets_with_more_than_4_moons
    end


    def get_number_of_planets_closer_than(distance_from_sun)
      planets_closer_to_the_sun=[]
      @planets.each do |planet|
        if planet.distance_from_sun<distance_from_sun
        planets_closer_to_the_sun.push(planet)
        end
      end
      return planets_closer_to_the_sun.length
    end



    # {planet.distance=>planet.name} grami 90
    # planets_disrance.keys grami 95
    # each |key| grami 99
    # palnets_distance["key"] grami 100
    def get_planet_names_sorted_by_increasing_distance_from_sun
      planets_closer_to_the_sun=[]
      a_hash={}
      require 'pp'
      #pp @planets
      a_array=@planets.map{|planet| {planet.distance_from_sun=>planet.name} }
      #pp a_array
      # https://stackoverflow.com/questions/10943909/array-of-hashes-to-hash
      a_hash=a_array.reduce Hash.new, :merge
      #pp a_hash
      distances_arr=a_hash.keys()
      #pp distances_arr
      d_sorted=distances_arr.sort
      #pp d_sorted
      d_sorted.each do |dist|
         planets_closer_to_the_sun.push(a_hash[dist])
      end
      pp planets_closer_to_the_sun
      return planets_closer_to_the_sun
    end

    end
