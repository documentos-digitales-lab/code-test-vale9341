class CustomerInformation
  attr_accessor :customer

  def initialize(customer)
    @customer = customer
  end

  def save
    body = get_request
    customer.update(first_name: body&.[]("firstName"), last_name: body&.[]("lastName"))
  end

  private

  def get_request
    response = RestClient.get("https://dummyjson.com/users/#{customer&.id}")
    JSON.parse(response&.body)
  end
end
