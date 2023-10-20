FactoryBot.define do
  factory :customer do
    rfc { "AAA010101000" }

    after(:build) { |customer| customer.class.skip_callback(:create, :after, :get_personal_data, raise: false) }

    factory :customer_get_personal_data do
      after(:create) { |customer| customer.send(:get_personal_data) }
    end
  end
end
