class Expense < ApplicationRecord
  belongs_to :ward
  belongs_to :vendor
  belongs_to :account

  # Validations
  validates :amount, numericality: { greater_than: 0 }
  validates :description, presence: true
end
