class Tag < ActiveRecord::Base
  has_many :project_tags
  has_many :projects, through: :project_tags
  
  attr_accessible :name
  def as_json(options = {})
    {
      id: self.id,
      label: self.name,
      value: self.name
    }
  end
  
end
