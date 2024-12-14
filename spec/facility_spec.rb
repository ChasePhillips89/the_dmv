require 'spec_helper'

RSpec.describe 'Facility and Vehicle Registration' do
  
  it 'can initialize' do
    facility = Facility.new('DMV Tremont Branch', '2855 Tremont Place Suite 118 Denver CO 80205', '(720) 865-4600')
    expect(facility).to be_an_instance_of(Facility)
    expect(facility.name).to eq('DMV Tremont Branch')
    expect(facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
    expect(facility.phone).to eq('(720) 865-4600')
    expect(facility.services).to eq([])
  end
  it 'adds a service to a facility' do
    facility = Facility.new('DMV Tremont Branch', '2855 Tremont Place Suite 118 Denver CO 80205', '(720) 865-4600')
    facility.add_service('Vehicle Registration')
    expect(facility.services).to include('Vehicle Registration')
  end

  it 'registers a vehicle and sets the registration date' do
    facility = Facility.new('DMV Tremont Branch', '2855 Tremont Place Suite 118 Denver CO 80205', '(720) 865-4600')
    facility.add_service('Vehicle Registration')

    vehicle = Vehicle.new('123456789abcdefgh', 2012, 'Chevrolet', 'Cruz', :ice)
    
    facility.register_vehicle(vehicle)

    
    expect(vehicle.registration_date).to eq(Date.new(2023, 1, 12))
    expect(vehicle.plate_type).to eq(:regular)
  end

  it 'collects fees when a vehicle is registered' do
    facility = Facility.new('DMV Tremont Branch', '2855 Tremont Place Suite 118 Denver CO 80205', '(720) 865-4600')
    facility.add_service('Vehicle Registration')

    vehicle = Vehicle.new('123456789abcdefgh', 2012, 'Chevrolet', 'Cruz', :ice)
    
    facility.register_vehicle(vehicle)

    expect(facility.collected_fees).to eq(100)
  end

  it 'registers multiple vehicles' do
    facility = Facility.new('DMV Tremont Branch', '2855 Tremont Place Suite 118 Denver CO 80205', '(720) 865-4600')
    facility.add_service('Vehicle Registration')

    cruz = Vehicle.new('123456789abcdefgh', 2012, 'Chevrolet', 'Cruz', :ice)
    camaro = Vehicle.new('1a2b3c4d5e6f', 1969, 'Chevrolet', 'Camaro', :ice)
    bolt = Vehicle.new('987654321abcdefgh', 2019, 'Chevrolet', 'Bolt', :ev)

    facility.register_vehicle(cruz)
    facility.register_vehicle(camaro)
    facility.register_vehicle(bolt)

    expect(facility.registered_vehicles).to include(cruz, camaro, bolt)
  end

  it 'sets the correct plate type for different vehicle types' do
    facility = Facility.new('DMV Tremont Branch', '2855 Tremont Place Suite 118 Denver CO 80205', '(720) 865-4600')
    facility.add_service('Vehicle Registration')

    cruz = Vehicle.new('123456789abcdefgh', 2012, 'Chevrolet', 'Cruz', :ice)
    camaro = Vehicle.new('1a2b3c4d5e6f', 1969, 'Chevrolet', 'Camaro', :ice)
    bolt = Vehicle.new('987654321abcdefgh', 2019, 'Chevrolet', 'Bolt', :ev)

    facility.register_vehicle(cruz)
    facility.register_vehicle(camaro)
    facility.register_vehicle(bolt)

    expect(cruz.plate_type).to eq(:regular)
    expect(camaro.plate_type).to eq(:antique)
    expect(bolt.plate_type).to eq(:ev)
  end

  it 'collects the correct fees for multiple vehicles' do
    facility = Facility.new('DMV Tremont Branch', '2855 Tremont Place Suite 118 Denver CO 80205', '(720) 865-4600')
    facility.add_service('Vehicle Registration')

    cruz = Vehicle.new('123456789abcdefgh', 2012, 'Chevrolet', 'Cruz', :ice)
    camaro = Vehicle.new('1a2b3c4d5e6f', 1969, 'Chevrolet', 'Camaro', :ice)
    bolt = Vehicle.new('987654321abcdefgh', 2019, 'Chevrolet', 'Bolt', :ev)

    facility.register_vehicle(cruz)
    facility.register_vehicle(camaro)
    facility.register_vehicle(bolt)

    expect(facility.collected_fees).to eq(325)
    
  end

  it 'does not register vehicles if there are no services' do
    facility = Facility.new('DMV Northeast Branch', '4685 Peoria Street Suite 101 Denver CO 80239', '(720) 865-4600')

    bolt = Vehicle.new('987654321abcdefgh', 2019, 'Chevrolet', 'Bolt', :ev)

    expect(facility.register_vehicle(bolt)).to be_nil
    expect(facility.registered_vehicles).to be_empty
    expect(facility.collected_fees).to eq(0)
  end
end
  