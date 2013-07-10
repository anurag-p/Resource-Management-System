class ResAllocation < ActiveRecord::Base
  belongs_to :allocation_date
  belongs_to :project
  belongs_to :resource
  attr_accessible :hours, :allocation_date_id, :project_id, :resource_id
end
