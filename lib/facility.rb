require 'date'
class Facility
  attr_reader :name, :address, :phone, :services, :collected_fees, :registered_vehicles

  def initialize( facility_info)
    @name = facility_info[:name]
    @address = facility_info[:address]
    @phone = facility_info[:phone]
    @services = []
    @collected_fees = 0
    @registered_vehicles = []
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)

    if services.include?('Vehicle Registration')
      
      vehicle.registration_date = Date.today

      plate_type = vehicle.plate_type
      
      collect_fees(plate_type)

      @registered_vehicles << vehicle
    end
  end

  def collect_fees(plate_type)
    if plate_type == :regular
      @collected_fees += 100
    elsif plate_type == :antique
      @collected_fees += 25
    elsif plate_type == :ev
      @collected_fees += 200
    else
      @collected_fees += 0  
    end
  end

  def administer_written_test(registrant)
    if registrant.age >= 16
    registrant.license_data[:written] = true
    end
  end

  def administer_road_test(registrant)
    
    if registrant.license_data[:written]
      registrant.license_data[:license] = true 
    else
      "Registrant must pass the written test before taking the road test!!!"
    end
  end

  def renew_drivers_license(registrant)
    
    return false unless services.include?('Renew License')
  
    
    return false unless registrant.license_data[:written] && registrant.license_data[:license]
  
    registrant.license_data[:renewed] = true
    true
  end
end