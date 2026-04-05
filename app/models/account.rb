class Account < ApplicationRecord
  has_many :expenses
  has_many :vendors, through: :expenses

  # Validations
  validates :account_name, presence: true
  validates :account_name, uniqueness: true
end
