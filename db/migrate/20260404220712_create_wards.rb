class CreateWards < ActiveRecord::Migration[7.2]
  def change
    create_table :wards do |t|
      t.string :ward_name
      t.string :council_member
      t.integer :total_population
      t.integer :median_age

      t.timestamps
    end
  end
end
