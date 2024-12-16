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

    
end
