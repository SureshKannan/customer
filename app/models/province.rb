class Province < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness=>true
  has_many :cities
  belongs_to :vendor
end
