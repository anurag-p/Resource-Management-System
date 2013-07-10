class Technology < ActiveRecord::Base
  attr_accessible :name, :tag_ids
  has_many :technologies_projects
  has_many :projects, through: :technologies_projects
  has_many  :tag_technologies, :dependent => :destroy
  has_many  :tags, :through => :tag_technologies
  
end
