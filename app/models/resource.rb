class Resource < ActiveRecord::Base
  attr_accessible :name, :position
  has_many :res_allocations, :dependent => :destroy
  has_many :projects, :through => :res_allocations
end
