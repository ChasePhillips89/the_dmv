require 'date'
class Vehicle
attr_accessor :vin, :year, :make, :model, :engine, :registration_date, :plate_type
def initialize(vin, year, make, model, engine)
  @vin = vin
  @year = year
  @make = make
  @model = model
  @engine = engine
  @registration_date = nil
end

def antique?
  Time.now.year - @year >= 25
end

def electric_vehicle?
  @engine == :ev  
end


def plate_type
  if antique?
    :antique 
  elsif electric_vehicle?
    :ev  
  else
    :regular 

  end
end
end