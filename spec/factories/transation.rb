FactoryBot.define do
  factory :transation do
    quantity {rand(1..20)}
    type_transation {'entrada'}
    association :product
  end
end