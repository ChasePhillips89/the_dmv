require 'date'
class Facility
  attr_reader :name, :address, :phone, :services, :collected_fees, :registered_vehicles

  def initialize(name, address, phone)
    @name = name
    @address = address
    @phone = phone
    @services = []
    @collected_fees = 0
    @registered_vehicles = []
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    
    if @services.include?('Vehicle Registration')
      plate_type = determine_plate_type(vehicle) 
      collect_fees(plate_type)
    else
      puts "Vehicle Registration service not available."
    end
  end

  def collect_fees(vehicle)
    plate_type = vehicle.plate_type
  
    if plate_type == "regular"
      @collected_fees += 100
    elsif plate_type == "antique"
      @collected_fees += 50
    elsif plate_type == "ev"
      @collected_fees += 75
    end
  end

 

  def determine_plate_type(vehicle)
   
    if vehicle.electric_vehicle? == "ev"
      return "ev"
    elsif vehicle.year < 1975
      return "antique"
    else
      return "regular"
    end
  end
end