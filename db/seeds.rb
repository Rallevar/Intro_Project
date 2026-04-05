# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "csv"
require "faker"

csv_path = Rails.root.join("db", "Council_Member_Expenses.csv")
csv_data = File.read(csv_path)

puts "Seeding database.  Please wait."
puts "Clearing database"

Expense.destroy_all
Ward.destroy_all
Vendor.destroy_all
Account.destroy_all

puts "Database cleared. Loading data from csv."
data_source = CSV.parse(csv_data, headers: true, encoding: 'iso-8859-1')

puts "Creating Wards from csv data."
data_source.first(400).each do |entry|
  Ward.find_or_create_by!(ward_name: entry["Ward/Office"]) do |ward|
    ward.council_member = entry["Council Member"]
    ward.total_population = Faker::Number.between(from: 5_000, to: 50_000)
    ward.median_age = Faker::Number.decimal(l_digits: 2)
  end
end

puts "Creating Vendors and Accounts from csv data."
data_source.first(400).each do |row|
  Vendor.find_or_create_by(vendor_name: row["Vendor"])
  Account.find_or_create_by(account_name: row["Account"])
end

puts "Creating Expenses from csv data."
data_source.first(400).each do |row|
  Expense.create!(
    ward: Ward.find_by(ward_name: row["Ward/Office"]),
    vendor: Vendor.find_by(vendor_name: row["Vendor"]),
    account: Account.find_by(account_name: row["Account"]),
    entry_date: Date.parse(row["Journal Date"]),
    description: row["Description"],
    amount: row["Amount"].delete("$").to_f,
    department: row["Department"]
  )
end

puts "Thank you for waiting. Database has been seeded."