require 'spec_helper'
require 'pry'

RSpec.describe DMVFacility do

  it 'confirms offices class exists' do

    @facility = DMVFacility.new

    expect(@facility).to be_a(DMVFacility)

  end


  it 'returns an array' do
    co_office_locations = DmvDataService.new.co_dmv_office_locations
  

  expect(co_office_locations).to be_an(Array)
  end

  it 'creates colorado offices' do
    
    co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
    @facility = DMVFacility.new
   
    @facility.create_facilities(co_dmv_office_locations)

    expect(@facility.facilities[0].name).to eq("DMV Tremont Branch  ")
    expect(@facility.facilities[0].address).to eq("2855 Tremont Place   Denver CO ")
    expect(@facility.facilities[0].phone).to eq("(720) 865-4600")
     
    
  end

  it 'creates ny offices' do

    ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
    @facility = DMVFacility.new

    @facility.create_facilities(ny_dmv_office_locations)

    expect(@facility.facilities[0].name).to eq(" LAKE PLACID ")
    expect(@facility.facilities[0].address).to eq("  2693 MAIN STREET LAKE PLACID NY 12946")
    expect(@facility.facilities[0].phone).to eq(nil)

  end
  
  it 'creates missour offices' do

    mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
    @facility = DMVFacility.new

    @facility.create_facilities(mo_dmv_office_locations)

    expect(@facility.facilities[0].name).to eq("  Harrisonville")
    expect(@facility.facilities[0].address).to eq(" 2009 Plaza Dr.  Harrisonville MO ")
    expect(@facility.facilities[0].phone).to eq("(816) 884-4133")

  end
    
end
