class TechnologiesProject < ActiveRecord::Base
  belongs_to :technology
  belongs_to :project
  attr_accessible :technology_id
end
