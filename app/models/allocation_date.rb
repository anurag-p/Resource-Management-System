class AllocationDate < ActiveRecord::Base
  attr_accessible :value, :res_allocations_attributes
  has_many :res_allocations, :dependent => :destroy
  accepts_nested_attributes_for :res_allocations, :reject_if => lambda { |a| a[:project_id].blank? && a[:resource_id].blank? }, :allow_destroy => true
  
  
#  def self.find_or_create params
#    unless allocation_date = where("value=?",params[:value]).first
#      allocation_date=new
#      allocation_date.value=params[:value]
#    end
#    allocation_date
#  end
  
end
