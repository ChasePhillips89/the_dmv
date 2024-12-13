class Dmv
attr_reader :facilities
  def initialize
    @facilities = []
  end

  def add_facility(facility)
    @facilities << facility
  end

  def facilities_offering_service(service)
    result = []  
    @facilities.each do |facility| 
      result << facility if facility.services.include?(service)
    end
    result  
  end
end
