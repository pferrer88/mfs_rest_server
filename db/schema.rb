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

ActiveRecord::Schema.define(:version => 20130509170045) do

  create_table "components", :force => true do |t|
    t.integer  "service_id"
    t.string   "code"
    t.string   "name"
    t.string   "shortName"
    t.string   "description"
    t.boolean  "isActive"
    t.string   "uomCode"
    t.string   "uomUnit"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "components", ["service_id"], :name => "index_components_on_service_id"

  create_table "contacts", :force => true do |t|
    t.integer  "location_id"
    t.string   "title"
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "contacts", ["location_id"], :name => "index_contacts_on_location_id"

  create_table "contract_components", :force => true do |t|
    t.integer  "contract_service_id"
    t.integer  "component_id"
    t.float    "price"
    t.integer  "chargeCode"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "contract_components", ["component_id"], :name => "index_contract_components_on_component_id"
  add_index "contract_components", ["contract_service_id"], :name => "index_contract_components_on_contract_service_id"

  create_table "contract_services", :force => true do |t|
    t.integer  "driver_id"
    t.integer  "contract_id"
    t.integer  "service_id"
    t.date     "earliestCurrentServiceDate"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "contract_services", ["contract_id"], :name => "index_contract_services_on_contract_id"
  add_index "contract_services", ["driver_id"], :name => "index_contract_services_on_driver_id"
  add_index "contract_services", ["service_id"], :name => "index_contract_services_on_service_id"

  create_table "contracts", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "location_id"
    t.date     "earliestCurrentServiceDate"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "contracts", ["customer_id"], :name => "index_contracts_on_customer_id"
  add_index "contracts", ["location_id"], :name => "index_contracts_on_location_id"

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "groupCode"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "drivers", :force => true do |t|
    t.string   "name"
    t.string   "username"
    t.string   "code"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "locations", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "destination_id"
    t.integer  "contact_id"
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.integer  "postalCode"
    t.boolean  "isActive"
    t.date     "lastModifiedOn"
    t.date     "lastModifiedBy"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "code"
  end

  add_index "locations", ["contact_id"], :name => "index_locations_on_contact_id"
  add_index "locations", ["customer_id"], :name => "index_locations_on_customer_id"
  add_index "locations", ["destination_id"], :name => "index_locations_on_destination_id"

  create_table "routes", :force => true do |t|
    t.integer  "driver_id"
    t.string   "name"
    t.date     "startDT"
    t.boolean  "isComplete"
    t.date     "completeDT"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "routes", ["driver_id"], :name => "index_routes_on_driver_id"

  create_table "services", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "shortName"
    t.string   "description"
    t.boolean  "isActive"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "stops", :force => true do |t|
    t.integer  "route_id"
    t.integer  "contract_id"
    t.integer  "sequence"
    t.boolean  "isComplete"
    t.date     "completeDT"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "stops", ["contract_id"], :name => "index_stops_on_contract_id"
  add_index "stops", ["route_id"], :name => "index_stops_on_route_id"

end
