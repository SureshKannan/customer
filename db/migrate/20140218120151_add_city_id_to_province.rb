class AddCityIdToProvince < ActiveRecord::Migration
  def change
    add_column :provinces, :cityid, :integer
  end
end
