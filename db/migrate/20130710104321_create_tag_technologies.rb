class CreateTagTechnologies < ActiveRecord::Migration
  def change
    create_table :tag_technologies do |t|
      t.references :technology
      t.references :tag

      t.timestamps
    end
    add_index :tag_technologies, :technology_id
    add_index :tag_technologies, :tag_id
  end
end
