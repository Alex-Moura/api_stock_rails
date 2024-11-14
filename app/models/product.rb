class Product < ApplicationRecord
  belongs_to :category
  belongs_to :supplier
  has_many :transations

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: true
  validates :min_quantity, presence: true
  validates :current_quantity, presence: true
end
