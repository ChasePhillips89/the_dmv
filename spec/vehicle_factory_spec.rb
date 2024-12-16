require 'spec_helper'

RSpec.describe VehicleFactory do

  it 'confirms vehicle factory class exists' do

    @factory = VehicleFactory.new

    expect(@factory).to be_a(VehicleFactory)
  end

  it 'returns an array' do
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations

    expect(@wa_ev_registrations).to be_an(Array)
  end

  it 'creates vehicles' do
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    @factory = VehicleFactory.new
    
      registrations = [
        { make: "TOYOTA", model: "Prius Plug-in", year: "2013", vin: "JTDKN3DP8D" },
        { make: "TOYOTA", model: "Prius Prime", year: "2018", vin: "JTDKARFP9J" },
        { make: "NISSAN", model: "Leaf", year: "2018", vin: "1N4AZ1CP0J" },
        { make: "NISSAN", model: "Leaf", year: "2018", vin: "1N4AZ1CP0J" },
        { make: "NISSAN", model: "Leaf", year: "2018", vin: "1N4AZ1CP0J" }
      ]

      vehicles = @factory.create_vehicles(registrations)

      
      
      expect(vehicles[0].make).to eq("TOYOTA")
      expect(vehicles[0].model).to eq("Prius Plug-in")
      expect(vehicles[0].year).to eq("2013")
      expect(vehicles[0].vin).to eq("JTDKN3DP8D")
      expect(vehicles[0].engine).to eq(:ev)
      expect(vehicles[1].make).to eq("TOYOTA")
      expect(vehicles[1].model).to eq("Prius Prime")
      expect(vehicles[1].year).to eq("2018")
      expect(vehicles[1].vin).to eq("JTDKARFP9J")
      expect(vehicles[1].engine).to eq(:ev)
      expect(vehicles[2].make).to eq("NISSAN")
      expect(vehicles[2].model).to eq("Leaf")
      expect(vehicles[2].year).to eq("2018")
      expect(vehicles[2].vin).to eq("1N4AZ1CP0J")
      expect(vehicles[2].engine).to eq(:ev)
      
    
  end
end