require 'spec_helper'

RSpec.describe 'Facility and Vehicle Registration' do

  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @facility_3 = Facility.new({name: 'DMV Northwest Branch', address: '3698 W. 44th Avenue Denver CO 80211', phone: '(720) 865-4600'})
  end
  
  it 'can initialize' do
    expect(@facility).to be_an_instance_of(Facility)
    expect(@facility.name).to eq('DMV Tremont Branch')
    expect(@facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
    expect(@facility.phone).to eq('(720) 865-4600')
    expect(@facility.services).to eq([])
  end
  it 'adds a service to a facility' do
    @facility.add_service('Vehicle Registration')
    expect(@facility.services).to include('Vehicle Registration')
  end

  it 'registers a vehicle and sets the registration date' do

    @facility.add_service('Vehicle Registration')

    cruz = Vehicle.new('123456789abcdefgh', 2012, 'Chevrolet', 'Cruz', :ice)
     
    @facility.register_vehicle(cruz)

    expect(@facility.registered_vehicles).to eq([cruz])
    expect(cruz.registration_date).to eq(Date.today)
    expect(cruz.plate_type).to eq(:regular)
  end

  it 'collects fees when a vehicle is registered' do

    @facility.add_service('Vehicle Registration')

    cruz = Vehicle.new('123456789abcdefgh', 2012, 'Chevrolet', 'Cruz', :ice)
    
    @facility.register_vehicle(cruz)

    expect(@facility.collected_fees).to eq(100)
  end

  it 'registers multiple vehicles' do

    @facility.add_service('Vehicle Registration')
    @facility_2.add_service('Vehicle Registration')

    cruz = Vehicle.new('123456789abcdefgh', 2012, 'Chevrolet', 'Cruz', :ice)
    camaro = Vehicle.new('1a2b3c4d5e6f', 1969, 'Chevrolet', 'Camaro', :ice)
    bolt = Vehicle.new('987654321abcdefgh', 2019, 'Chevrolet', 'Bolt', :ev)

    @facility.register_vehicle(cruz)
    @facility.register_vehicle(camaro)
    @facility.register_vehicle(bolt)

    expect(@facility.registered_vehicles).to include(cruz, camaro, bolt)
    
  end

  it 'gives registration date for vehicles' do

    @facility.add_service('Vehicle Registration')
    @facility_2.add_service('Vehicle Registration')

    cruz = Vehicle.new('123456789abcdefgh', 2012, 'Chevrolet', 'Cruz', :ice)
    camaro = Vehicle.new('1a2b3c4d5e6f', 1969, 'Chevrolet', 'Camaro', :ice)
    bolt = Vehicle.new('987654321abcdefgh', 2019, 'Chevrolet', 'Bolt', :ev)

    @facility.register_vehicle(cruz)
    @facility.register_vehicle(camaro)
    @facility.register_vehicle(bolt)

    expect(cruz.registration_date).to eq(Date.today)
    expect(camaro.registration_date).to eq(Date.today)
    expect(bolt.registration_date).to eq(Date.today)
  end

  it 'sets the correct plate type for different vehicle types' do

    @facility.add_service('Vehicle Registration')

    cruz = Vehicle.new('123456789abcdefgh', 2012, 'Chevrolet', 'Cruz', :ice)
    camaro = Vehicle.new('1a2b3c4d5e6f', 1969, 'Chevrolet', 'Camaro', :ice)
    bolt = Vehicle.new('987654321abcdefgh', 2019, 'Chevrolet', 'Bolt', :ev)

    @facility.register_vehicle(cruz)
    @facility.register_vehicle(camaro)
    @facility.register_vehicle(bolt)

    expect(cruz.plate_type).to eq(:regular)
    expect(camaro.plate_type).to eq(:antique)
    expect(bolt.plate_type).to eq(:ev)
  end

  it 'collects the correct fees for multiple vehicles' do

    @facility.add_service('Vehicle Registration')

    cruz = Vehicle.new('123456789abcdefgh', 2012, 'Chevrolet', 'Cruz', :ice)
    camaro = Vehicle.new('1a2b3c4d5e6f', 1969, 'Chevrolet', 'Camaro', :ice)
    bolt = Vehicle.new('987654321abcdefgh', 2019, 'Chevrolet', 'Bolt', :ev)

    @facility.register_vehicle(cruz)
    @facility.register_vehicle(camaro)
    @facility.register_vehicle(bolt)

    expect(@facility.collected_fees).to eq(325)
    
  end

  it 'does not register vehicles if there are no services' do

    bolt = Vehicle.new('987654321abcdefgh', 2019, 'Chevrolet', 'Bolt', :ev)

    expect(@facility.register_vehicle(bolt)).to be_nil
    expect(@facility.registered_vehicles).to be_empty
    expect(@facility.collected_fees).to eq(0)
  end

  it 'returns license data' do
    registrant_1 = Registrant.new('Bruce', 18, true )

    expect(registrant_1.license_data).to eq({ written: false, license: false, renewed: false })
  end
end
  