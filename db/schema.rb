# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130710104321) do

  create_table "allocation_dates", :force => true do |t|
    t.date     "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "project_tags", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "project_tags", ["project_id"], :name => "index_project_tags_on_project_id"
  add_index "project_tags", ["tag_id"], :name => "index_project_tags_on_tag_id"

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.integer  "duration"
    t.date     "exp_start_date"
    t.text     "synopsis"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "res_allocations", :force => true do |t|
    t.integer  "allocation_date_id"
    t.integer  "project_id"
    t.integer  "resource_id"
    t.time     "hours"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "res_allocations", ["allocation_date_id"], :name => "index_res_allocations_on_allocation_date_id"
  add_index "res_allocations", ["project_id"], :name => "index_res_allocations_on_project_id"
  add_index "res_allocations", ["resource_id"], :name => "index_res_allocations_on_resource_id"

  create_table "resources", :force => true do |t|
    t.string   "name"
    t.string   "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tag_technologies", :force => true do |t|
    t.integer  "technology_id"
    t.integer  "tag_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "tag_technologies", ["tag_id"], :name => "index_tag_technologies_on_tag_id"
  add_index "tag_technologies", ["technology_id"], :name => "index_tag_technologies_on_technology_id"

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "technologies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "technologies_projects", :force => true do |t|
    t.integer  "technology_id"
    t.integer  "project_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "technologies_projects", ["project_id"], :name => "index_technologies_projects_on_project_id"
  add_index "technologies_projects", ["technology_id"], :name => "index_technologies_projects_on_technology_id"

end
