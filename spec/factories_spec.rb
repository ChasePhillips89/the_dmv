require 'spec_helper'

RSpec.describe Factories do

  it 'confirms vehicle factory class exists' do

    @factory = Factories.new

    expect(@factory).to be_a(Factories)

  end


  it 'returns an array' do
  @co_office_locations = DmvDataService.new.co_dmv_office_locations

  expect(@co_office_locations).to be_an(Array)
  end

  it 'returns location information for both locations' do
      @co_office_locations = DmvDataService.new.co_dmv_office_locations

      location_info = [:the_geom, :dmv_id, :dmv_office, :address_li, :address__1, :city, :state, :zip,
        :phone, :hours, :services_p, :parking_no, :photo, :address_id, :":@computed_region_nku6_53ud"]

      location = locations.first

      expect(location[:dmv_office]).to eq("DMV Tremont Branch")
      expect(location[:address_li]).to eq("2855 Tremont Place")
      expect(location[:address__1]).to eq("Suite 118")
      expect(location[:city]).to eq("Denver")
      expect(location[:state]).to eq("CO")
      expect(location[:zip]).to eq("80205")
      expect(location[:phone]).to eq("(720) 865-4600")
      expect(location[:hours]).to eq("Mon, Tue, Thur, Fri  8:00 a.m.- 4:30 p.m. / Wed 8:30 a.m.-4:30 p.m.")
      expect(location[:services_p]).to eq("vehicle titles, registration, renewals;  VIN inspections")
      expect(location[:parking_no]).to eq("parking available in the lot at the back of the bldg (Glenarm Street)")
      expect(location[:photo]).to eq("images/Tremont.jpg")
      expect(location[:address_id]).to eq("175164")
      expect(location[":@computed_region_nku6_53ud"]).to eq("1444")
      
      
      location = locations[1]
      
      expect(location[:dmv_office]).to eq("DMV Northeast Branch")
      expect(location[:address_li]).to eq("4685 Peoria Street")
      expect(location[:address__1]).to eq("Suite 101")
      expect(location[:location]).to eq("Arie P. Taylor  Municipal Bldg")
      expect(location[:city]).to eq("Denver")
      expect(location[:state]).to eq("CO")
      expect(location[:zip]).to eq("80239")
      expect(location[:phone]).to eq("(720) 865-4600")
      expect(location[:hours]).to eq("Mon, Tue, Thur, Fri  8:00 a.m.- 4:30 p.m. / Wed 8:30 a.m.-4:30 p.m.")
      expect(location[:services_p]).to eq("vehicle titles, registration, renewals;  VIN inspections")
      expect(location[:parking_no]).to eq("parking available in both the front and back of the bldg; also on Paris Street")
      expect(location[:photo]).to eq("images/Peoria.jpg")
      expect(location[:address_id]).to eq("11348")
      expect(location[":@computed_region_nku6_53ud"]).to eq("1444")
    end
  end
end
