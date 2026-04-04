class Account < ApplicationRecord
  has_many :expenses

  # Validations
  validates :account_name, presence: true
  validates :account_name, uniqueness: true
end
