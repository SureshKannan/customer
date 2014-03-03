class City < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness=>true
  belongs_to :province
  belongs_to :vendor
end
