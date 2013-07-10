class CreateResAllocations < ActiveRecord::Migration
  def change
    create_table :res_allocations do |t|
      t.references :allocation_date
      t.references :project
      t.references :resource
      t.time :hours

      t.timestamps
    end
    add_index :res_allocations, :allocation_date_id
    add_index :res_allocations, :project_id
    add_index :res_allocations, :resource_id
  end
end
