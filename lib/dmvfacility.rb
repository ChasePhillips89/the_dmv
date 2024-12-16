class DMVFacility
  attr_reader :facilities

  def initialize
  @facilities = []
  end

  def create_facilities(facility_data)
    facility_data.each do |facility|
      new_facility = Facility.new({
        :name => facility[:dmv_office],
        :address => facility[:address_li],
        :phone => facility[:phone]
        
        
      })
      @facilities << new_facility
    end

    
  end
end