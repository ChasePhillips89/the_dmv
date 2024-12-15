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

  # it 'returns the vehicle factory data from the API' do
  #   @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  
    
end