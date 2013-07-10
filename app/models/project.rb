class Project < ActiveRecord::Base
  attr_accessible :hours, :title, :exp_start_date, :duration, :synopsis, :technology_ids, :tag_ids
  has_many :res_allocations, :dependent => :destroy
  has_many :resources, :through => :res_allocations
  has_many  :tags, :dependent => :destroy
  has_many  :tags, :through => :tags_projects
  has_many  :technologies_projects, :dependent => :destroy
  has_many  :technologies, through: :technologies_projects  
  has_many  :project_tags, :dependent => :destroy
  has_many  :tags, :through => :project_tags
  
  def taggings
    tag_name=[]
    self.tags.select("name").each {|tag| tag_name << tag.name }
    tag_name.join(",")
  end
end
