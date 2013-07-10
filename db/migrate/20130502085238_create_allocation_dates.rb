class CreateAllocationDates < ActiveRecord::Migration
  def change
    create_table :allocation_dates do |t|
      t.date :value

      t.timestamps
    end
  end
end
