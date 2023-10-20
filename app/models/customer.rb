class Customer < ApplicationRecord
  has_many :products
  validates :rfc, presence: true
  after_create :get_personal_data

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def get_personal_data
    CustomerInformation.new(self).save
  end
end
