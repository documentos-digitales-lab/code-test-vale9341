require "rails_helper"

RSpec.feature "Creation the products" do
  let(:customer) { create(:customer) } 

  scenario "calculate amounts totals" do
    visit new_customer_product_path customer
    expect(page).to have_content "Item # 1"
    expect(page).to have_content "Item # 2"
    expect(page).to have_content "Sub Total:"
    expect(page).to have_content "Tax:"
    expect(page).to have_content "Total:"
  end
end
