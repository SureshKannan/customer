class RenameColumnProvinceidCityid < ActiveRecord::Migration
  def change
    rename_column :vendors, :provinceid, :province_id
    rename_column :vendors, :cityid, :city_id
    rename_column :cities, :provinceid, :province_id
  end
end
