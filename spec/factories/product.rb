# spec/factories/users.rb
FactoryBot.define do
  factory :product do
    name {FFaker::Name.name}
    description {FFaker::Name.name}
    price { rand(1.0..100.0).round(2) }  # Gera um preço entre 1.00 e 100.00 com duas casas decimais
    min_quantity { rand(1..20) }
    current_quantity { rand(1..20) }
    association :category
    association :supplier
  end
end
