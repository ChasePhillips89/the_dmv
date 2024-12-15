require 'spec_helper'

RSpec.describe VehicleFactory do

  it 'confirms vehicle factory class exists' do

    @factory = VehicleFactory.new

    expect(@factory).to be_a(VehicleFactory)
  end

  it 'returns an array of washington vehicle ev registrations' do

    @factory = VehicleFactory.new
      
      first_entry = wa_ev_registrations[0]
      expect(first_entry).to be_a(Hash)
      expect(first_entry[:electric_vehicle_type]).to eq('Plug-in Hybrid Electric Vehicle (PHEV)')
      expect(first_entry[:vin_1_10]).to eq('JTDKN3DP8D')
      expect(first_entry[:dol_vehicle_id]).to eq('229686908')
      expect(first_entry[:model_year]).to eq('2013')
      expect(first_entry[:make]).to eq('TOYOTA')
      expect(first_entry[:model]).to eq('Prius Plug-in')

      # # Assert: Check another entry
      # second_entry = wa_ev_registrations[1]
      # expect(second_entry).to be_a(Hash)
      # expect(second_entry[:electric_vehicle_type]).to eq('Plug-in Hybrid Electric Vehicle (PHEV)')
      # expect(second_entry[:vin_1_10]).to eq('1G1RD6E47D')
      # expect(second_entry[:dol_vehicle_id]).to eq('289314742')
      # expect(second_entry[:model_year]).to eq('2013')
      # expect(second_entry[:make]).to eq('CHEVROLET')
      # expect(second_entry[:model]).to eq('Volt')
    
  end
end


    
      
      

