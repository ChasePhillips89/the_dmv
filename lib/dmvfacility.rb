class DMVFacility
  attr_reader :facilities

  def initialize
  @facilities = []
  end

  def create_facilities(facility_data)
    facility_data.each do |facility|
      new_facility = Facility.new({
        :name => "#{facility[:dmv_office]} #{facility[:office_name]} #{facility[:name]}",
        :address => "#{facility[:address_li]} #{facility[:address1]} #{facility[:street_address_line_1]} #{facility[:city]} #{facility[:state]} #{facility[:zip_code]}",
        :phone => facility[:phone]
        
        
      })
      @facilities << new_facility
    end

    
  end
end