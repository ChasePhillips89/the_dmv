require 'date'

class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles

  def initialize(attributes = {})
    @name = attributes[:name] || ''
    @address = attributes[:address] || ''
    @phone = attributes[:phone] || ''
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_services(service)
    @services << service
  end
end