class TagTechnology < ActiveRecord::Base
  belongs_to :technology
  belongs_to :tag
  # attr_accessible :title, :body
end
