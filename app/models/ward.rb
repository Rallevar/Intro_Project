=begin
  Name: Nathan Keenan
  Program: Business Information Technology
  Course: WEBD-3011 (277098)
  Created: 2026-04-06
  Updated: 2024-04-13
=end

class Ward < ApplicationRecord
  has_many :expenses
  has_many :vendors, through: :expenses
  has_many :accounts, through: :expenses

  # Validations
  validates :ward_name, presence: true
  validates :total_population, numericality: { greater_than_or_equal_to: 0 }
end
