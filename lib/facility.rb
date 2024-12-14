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
    # Check if 'Vehicle Registration' service is available
    return nil unless @services.include?('Vehicle Registration')

    # Set the registration date and plate type (no need to modify Vehicle class)
    vehicle.instance_variable_set(:@registration_date, Date.new(2023, 1, 12))
    vehicle.instance_variable_set(:@plate_type, determine_plate_type(vehicle))

    # Add the vehicle to the list of registered vehicles
    @registered_vehicles << vehicle

    # Collect fees based on the plate type
    collect_fees(vehicle)
  end

  def collect_fees(vehicle)
    plate_type = vehicle.instance_variable_get(:@plate_type)

    if plate_type == :regular
      @collected_fees += 100
    elsif plate_type == :antique
      @collected_fees += 50
    elsif plate_type == :ev
      @collected_fees += 75
    end
  end

  private

  def determine_plate_type(vehicle)
    # Determine the plate type based on the vehicle's year and type using simple conditionals
    if vehicle.vehicle_type == :ev
      return :ev
    elsif vehicle.year < 1975
      return :antique
    else
      return :regular
    end
  end
end