require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "associations" do
    it { should belong_to(:customer) }
  end

  describe "validations" do
    it { should validate_presence_of(:quantity) }
    it { should validate_presence_of(:product) }
    it { should validate_presence_of(:unit_price) }
  end
end
