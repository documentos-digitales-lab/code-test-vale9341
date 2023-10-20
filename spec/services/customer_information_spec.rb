require 'webmock/rspec'
require 'rails_helper'

RSpec.describe CustomerInformation do
  let(:customer) { build(:customer) }
  let(:response) { 
    {
      "firstName": "Bradford",
      "lastName": "Prohaska"
    }
  }
  let(:subject) { described_class.new(customer) }

  describe "#save" do
    context "when response is successful" do
      before do
        stub_request(:get, "https://dummyjson.com/users/#{customer.id}")
          .to_return(body: response.to_json, status: 200)
      end

      it "update successful" do
        expect(customer.first_name).to be_nil
        expect(customer.last_name).to be_nil
        subject.save
        customer.reload
        expect(customer.first_name).to eq response[:firstName]
        expect(customer.last_name).to eq response[:lastName]
      end
    end
  end
end
