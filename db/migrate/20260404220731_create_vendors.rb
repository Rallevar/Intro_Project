class CreateVendors < ActiveRecord::Migration[7.2]
  def change
    create_table :vendors do |t|
      t.string :vendor_name

      t.timestamps
    end
  end
end
