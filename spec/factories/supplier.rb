FactoryBot.define do
  factory :supplier do
    name {FFaker::Name.name}
    address {FFaker::Address.street_address}
    phone {FFaker::PhoneNumber.phone_number}
    email {FFaker::Internet.email}
  end
end