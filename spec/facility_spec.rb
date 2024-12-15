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

  it 'does not register vehicles if vehicle registration is not a service' do

    bolt = Vehicle.new('987654321abcdefgh', 2019, 'Chevrolet', 'Bolt', :ev)

    @facility_2.register_vehicle(bolt)

    expect(@facility_2.register_vehicle(bolt)).to be_nil
    expect(@facility_2.registered_vehicles).to be_empty
    expect(@facility_2.collected_fees).to eq(0)
  end

  it 'returns license data' do
    registrant_1 = Registrant.new('Bruce', 18, true )

    expect(registrant_1.license_data).to eq({ written: false, license: false, renewed: false })
  end

  it 'returns if registrant has a permit' do

    registrant_1 = Registrant.new('Bruce', 18, true )
 
    expect(registrant_1.permit?).to eq(true)
  end

  it 'administers written test' do
    registrant_1 = Registrant.new('Bruce', 18, true )
    registrant_2 = Registrant.new('Penny', 16 )
    registrant_3 = Registrant.new('Tucker', 15 )
    

    expect(registrant_1.license_data[:written]).to eq(false)
    expect(registrant_2.license_data[:written]).to eq(false)
    expect(registrant_3.license_data[:written]).to eq(false)

    @facility.administer_written_test(registrant_1)
    

    registrant_2.earn_permit
    registrant_3.earn_permit

    @facility.administer_written_test(registrant_2)
    @facility.administer_written_test(registrant_3)
    
    @facility.add_service('Written Test')

    expect(registrant_1.license_data[:written]).to eq(true)
    expect(registrant_2.license_data[:written]).to eq(true)
    expect(registrant_3.license_data[:written]).to eq(false)
  end

  it 'shows registrant has taken written test' do
    registrant_1 = Registrant.new('Bruce', 18, true )

    @facility.add_service('Written Test')

    @facility.administer_written_test(registrant_1)

    expect(registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
    
  end

  it 'returns the registrants age' do
    registrant_2 = Registrant.new('Penny', 16 )
    registrant_3 = Registrant.new('Tucker', 15 )

    expect(registrant_2.age).to eq(16)
    expect(registrant_3.age).to eq(15)
  end

  it 'returns if registrant has a permit' do
    registrant_2 = Registrant.new('Penny', 16)
    registrant_3 = Registrant.new('Tucker', 15 )

    expect(registrant_2.permit?).to eq(false)
    expect(registrant_3.permit?).to eq(false)

  end

  it 'administers road test' do
    registrant_1 = Registrant.new('Bruce', 18, true )
    registrant_2 = Registrant.new('Penny', 16 )
    registrant_3 = Registrant.new('Tucker', 15 )

    @facility.administer_written_test(registrant_3)
    @facility.administer_written_test(registrant_1)

    registrant_3.earn_permit

    @facility.add_service('Road Test')

    @facility.administer_road_test(registrant_3)
    @facility.administer_road_test(registrant_1)

    expect(registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    expect(registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
  end




   

    
  
end
  