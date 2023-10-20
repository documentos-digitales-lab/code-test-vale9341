FactoryBot.define do
  factory :customer do
    rfc { "AAA010101000" }

    after(:build) { |customer| customer.class.skip_callback(:create, :after, :get_personal_data, raise: false) }
  end
end
