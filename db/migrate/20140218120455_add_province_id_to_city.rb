class AddProvinceIdToCity < ActiveRecord::Migration
  def change
    remove_column :provinces, :cityid
    add_column :cities, :provinceid, :integer
  end
end
