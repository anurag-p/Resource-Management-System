class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string      :title
      t.integer     :duration
      t.date        :exp_start_date
#      t.references  :techonology
#      t.references  :tag
      t.text        :synopsis

      t.timestamps
    end
  end
end
