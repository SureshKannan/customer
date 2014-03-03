class Vendor < ActiveRecord::Base
  has_one :province
  has_one :city
end
