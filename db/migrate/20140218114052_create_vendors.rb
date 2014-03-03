class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :firstName, :size=>75
      t.string :lastName, :size=>75
      t.integer :provinceid
      t.integer :cityid 
      t.timestamps
    end
  end
end
