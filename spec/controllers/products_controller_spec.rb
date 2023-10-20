require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let(:customer) { create(:customer, id: 1) } 
  
  describe "routing" do
    it "routes to #new" do
      expect(get: "/customers/1/products/new").to route_to("products#new", customer_id: "1")
    end

    it "routes to #create" do
      expect(post: "/customers/1/products").to route_to(
        "products#create", customer_id: "1")
    end
  end

  describe "Get #new" do
    it "render view" do
      get :new, params: { customer_id: customer.id }
      expect(response).to render_template(:new)
      expect(response).to render_with_layout(:application)
    end
  end

  describe "POST #create" do
    before do
      post :create,
        params: {
          customer_id: customer.id,
          products: [
            {
              quantity: 1,
              product: 123456,
              unit_price: 100,
              amount: 100,
            }
          ]
        }  
    end

    it "return a success response" do
      expect(response).to have_http_status(302)
      expect(response).to redirect_to customer_path(customer.id)
    end
  end
end