require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe "associations" do
    it { should have_many(:products) }
  end

  it { should validate_presence_of :rfc }
end
