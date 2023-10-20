require "rails_helper"

RSpec.feature "A customer checks into the app" do
  let(:customer) { create(:customer_get_personal_data, id: 1) }
  let(:response) { 
    {
      "firstName": "Bradford",
      "lastName": "Prohaska"
    }
  }

  before do
    stub_request(:get, "https://dummyjson.com/users/1")
      .to_return(body: response.to_json, status: 200)
  end

  scenario "for a scheduled appointment" do
    visit root_path

    click_on "Start app"

    expect(page).to have_content "Please complete all of the steps on this page"

    click_on "Create An Invoice"

    expect(page).to have_content("Please add your products and click on Create:")
  end
  
  scenario "show greating" do
    visit customer_path(customer.id)

    expect(page).to have_content "Hello #{customer.full_name}"
  end
end
