class CreateTechnologiesProjects < ActiveRecord::Migration
  def change
    create_table :technologies_projects do |t|
      t.references :technology
      t.references :project

      t.timestamps
    end
    add_index :technologies_projects, :technology_id
    add_index :technologies_projects, :project_id
  end
end
