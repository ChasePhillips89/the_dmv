class Dmv
attr_reader :facilities
  def initialize
    @facilities = []
  end

  def add_facility(facility)
    @facilities << facility
  end

  def facilities_offering_service(service)
    fac_offer_serv = []  
    @facilities.each do |facility| 
      fac_offer_serv << facility if facility.services.include?(service)
    end
    fac_offer_serv 
  end
end
