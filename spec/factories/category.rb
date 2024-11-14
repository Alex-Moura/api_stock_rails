FactoryBot.define do
  factory :category do
    name {FFaker::Name.name}
    description {FFaker::Name.name}
  end
end