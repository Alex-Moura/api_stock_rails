# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Transation, type: :model do
  let(:transation) {FactoryBot.build :transation }

  it {is_expected.to belong_to(:product)}

  it {is_expected.to validate_presence_of(:quantity)}
  it {is_expected.to validate_presence_of(:type_transation)}
end
