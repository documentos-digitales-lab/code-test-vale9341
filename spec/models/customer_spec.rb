require 'rails_helper'

RSpec.describe Customer, type: :model do
  let(:response) { 
    {
      "firstName": "Bradford",
      "lastName": "Prohaska"
    }
  }

  describe "associations" do
    it { should have_many(:products) }
  end

  describe "validations" do
    it { should validate_presence_of :rfc }
  end

  describe "#full_name" do
    before do
      stub_request(:get, "https://dummyjson.com/users/1")
        .to_return(body: response.to_json, status: 200)
    end

    it "success response" do
      customer = create(:customer_get_personal_data, id: 1)
      full_name = "#{response[:firstName]} #{response[:lastName]}"
      expect(customer.full_name).to eq full_name
    end
  end
end
