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

    first_office_data = co_dmv_office_locations.first
    first_facility = @facility.facilities.first

    expect(@facility.facilities[0].name).to eq("DMV Tremont Branch")
    expect(@facility.facilities[0].address).to eq("2855 Tremont Place")
    expect(@facility.facilities[0].phone).to eq("(720) 865-4600")
     
    
  end
  
    
end
