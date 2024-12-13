require 'spec_helper'

RSpec.describe Registrant do
  
    it 'creates a registrant with name, age, and permit status when they have permit' do
      registrant_1 = Registrant.new('Bruce', 18, true)
      expect(registrant_1.name).to eq('Bruce')
      expect(registrant_1.age).to eq(18)
      expect(registrant_1.permit?).to be(true)
      expect(registrant_1.license_data).to eq({:written => false, :license => false, :renewed => false})
    end

    it 'creates a registrant with name, age, and permit status when they do not have permit' do
      registrant_2 = Registrant.new('Penny', 15)
      expect(registrant_2.name).to eq('Penny')
      expect(registrant_2.age).to eq(15)
      expect(registrant_2.permit?).to be(false)
      expect(registrant_2.license_data).to eq({:written => false, :license => false, :renewed => false})
    end
  

  
    it 'returns true if the registrant has a permit' do
      registrant_1 = Registrant.new('Bruce', 18, true)
      expect(registrant_1.permit?).to be(true)
    end

    it 'returns false if the registrant does not have a permit' do
      registrant_2 = Registrant.new('Penny', 15)
      expect(registrant_2.permit?).to be(false)
    end
  

    it 'does not change the permit status if the registrant already has a permit' do
      registrant_1 = Registrant.new('Bruce', 18, true)
      registrant_1.earn_permit
      expect(registrant_1.permit?).to be(true)
    end
  
end