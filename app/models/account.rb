=begin
  Name: Nathan Keenan
  Program: Business Information Technology
  Course: WEBD-3011 (277098)
  Created: 2026-04-06
  Updated: 2024-04-13
=end

class Account < ApplicationRecord
  has_many :expenses
  has_many :vendors, through: :expenses
  has_many :wards, through: :expenses

  # Validations
  validates :account_name, presence: true
  validates :account_name, uniqueness: true
end
