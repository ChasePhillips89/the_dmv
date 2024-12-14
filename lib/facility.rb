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
      
      vehicle.registration_date = Date.new(2023, 1, 12)

      plate_type = vehicle.plate_type
      
      collect_fees(plate_type)

      @registered_vehicles << vehicle
    else
      puts "Vehicle Registration service not available."
    end
  end

  def collect_fees(plate_type)
    if plate_type == :regular
      @collected_fees += 100
    elsif plate_type == :antique
      @collected_fees += 50
    elsif plate_type == :ev
      @collected_fees += 75
    else
      @collected_fees += 0  
    end
  end

 

  def collect_fees(plate_type)
    
    case plate_type
    when :regular
      @collected_fees += 100
    when :antique
      @collected_fees += 50
    when :ev
      @collected_fees += 75
    else
      @collected_fees += 0  
    end
  end
end