# frozen_string_literal: true
require 'rails_helper'


RSpec.describe Supplier, type: :model do
  let(:supplier) { FactoryBot.build :supplier }

  it {is_expected.to have_many(:products)}

  it {is_expected.to validate_presence_of(:name)}
  it {is_expected.to validate_presence_of(:address)}
  it {is_expected.to validate_presence_of(:phone)}
  it {is_expected.to validate_presence_of(:email)}
end
