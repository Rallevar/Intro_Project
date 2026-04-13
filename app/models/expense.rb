=begin
  Name: Nathan Keenan
  Program: Business Information Technology
  Course: WEBD-3011 (277098)
  Created: 2026-04-06
  Updated: 2024-04-13
=end

class Expense < ApplicationRecord
  belongs_to :ward
  belongs_to :vendor
  belongs_to :account

  # Validations
  validates :amount, presence: true
  validates :description, presence: true
end
