class Transation < ApplicationRecord
  belongs_to :product

  validates :quantity, presence: true
  validates :type_transation, presence: true
end
