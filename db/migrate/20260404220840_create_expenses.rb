class CreateExpenses < ActiveRecord::Migration[7.2]
  def change
    create_table :expenses do |t|
      t.references :ward, null: false, foreign_key: true
      t.references :vendor, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true
      t.string :entry_date
      t.text :description
      t.string :account
      t.decimal :amount
      t.string :department

      t.timestamps
    end
  end
end
