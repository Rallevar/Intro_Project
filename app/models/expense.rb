class Expense < ApplicationRecord
  belongs_to :ward
  belongs_to :vendor
  belongs_to :account
end
