# frozen_string_literal: true
require 'rails_helper'



RSpec.describe Category, type: :model do
  let(:category) { FactoryBot.build :category }

  it {is_expected.to have_many(:products)}
  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to validate_presence_of(:name) }

end
