# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product) { FactoryBot.build :product }

  context 'Asociation' do
    it {is_expected.to belong_to(:category)}
    it {is_expected.to belong_to(:supplier)}
  end

  context 'validate presence' do
    it {is_expected.to validate_presence_of(:name)}
    it {is_expected.to validate_presence_of(:description)}
    it {is_expected.to validate_presence_of(:price)}
    it {is_expected.to validate_presence_of(:min_quantity)}
    it {is_expected.to validate_presence_of(:current_quantity)}
  end

  context 'verificando se e numero' do
    it {is_expected.to validate_numericality_of(:price)}
  end
end
