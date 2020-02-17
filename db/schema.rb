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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171224093001) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ip_networks", force: :cascade do |t|
    t.bigint "network_id"
    t.integer "network_type", limit: 2, default: 0, null: false
    t.cidr "address", null: false
    t.inet "gateway"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address"], name: "index_ip_networks_on_address"
    t.index ["network_id"], name: "index_ip_networks_on_network_id"
  end

  create_table "ip_pools", force: :cascade do |t|
    t.bigint "ip_network_id"
    t.integer "network_type", limit: 2, default: 0, null: false
    t.inet "first", null: false
    t.inet "last", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ip_network_id"], name: "index_ip_pools_on_ip_network_id"
  end

  create_table "network_users", force: :cascade do |t|
    t.bigint "network_id"
    t.bigint "user_id"
    t.boolean "default", default: false, null: false
    t.boolean "assignable", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["network_id"], name: "index_network_users_on_network_id"
    t.index ["user_id"], name: "index_network_users_on_user_id"
  end

  create_table "networks", force: :cascade do |t|
    t.string "name", null: false
    t.integer "vlan", limit: 2
    t.boolean "use_auth", default: false, null: false
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_networks_on_name", unique: true
    t.index ["vlan"], name: "index_networks_on_vlan"
  end

  create_table "nics", force: :cascade do |t|
    t.string "name"
    t.bigint "node_id"
    t.integer "network_type", limit: 2, default: 0, null: false
    t.bigint "network_id"
    t.integer "mac_address"
    t.integer "ipv4_setting", limit: 2, default: 0, null: false
    t.integer "ipv6_setting", limit: 2, default: 0, null: false
    t.integer "ipv4"
    t.binary "ipv6"
    t.datetime "connected"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mac_address"], name: "index_nics_on_mac_address", unique: true
    t.index ["network_id"], name: "index_nics_on_network_id"
    t.index ["node_id"], name: "index_nics_on_node_id"
  end

  create_table "node_hadrwares", force: :cascade do |t|
    t.bigint "node_id"
    t.bigint "node_model_id"
    t.string "maker"
    t.string "product_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["node_id"], name: "index_node_hadrwares_on_node_id"
    t.index ["node_model_id"], name: "index_node_hadrwares_on_node_model_id"
  end

  create_table "node_models", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_node_models_on_name", unique: true
  end

  create_table "node_softwares", force: :cascade do |t|
    t.bigint "node_id"
    t.bigint "os_version_id"
    t.bigint "security_software_id"
    t.string "hostname"
    t.string "duid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hostname"], name: "index_node_softwares_on_hostname"
    t.index ["node_id"], name: "index_node_softwares_on_node_id"
    t.index ["os_version_id"], name: "index_node_softwares_on_os_version_id"
    t.index ["security_software_id"], name: "index_node_softwares_on_security_software_id"
  end

  create_table "nodes", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "owner_id"
    t.datetime "confirmed"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_nodes_on_name"
    t.index ["owner_id"], name: "index_nodes_on_owner_id"
  end

  create_table "os_families", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_os_families_on_name", unique: true
  end

  create_table "os_products", force: :cascade do |t|
    t.string "name"
    t.bigint "os_family_id"
    t.boolean "require_security_software"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_os_products_on_name", unique: true
    t.index ["os_family_id"], name: "index_os_products_on_os_family_id"
  end

  create_table "os_versions", force: :cascade do |t|
    t.string "name"
    t.bigint "os_product_id"
    t.string "version"
    t.date "release"
    t.date "end_of_life"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_os_versions_on_name", unique: true
    t.index ["os_product_id"], name: "index_os_versions_on_os_product_id"
  end

  create_table "security_softwares", force: :cascade do |t|
    t.string "name"
    t.boolean "has_expiration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_security_softwares_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username", null: false
    t.string "display_name"
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "ip_networks", "networks"
  add_foreign_key "ip_pools", "ip_networks"
  add_foreign_key "network_users", "networks"
  add_foreign_key "network_users", "users"
  add_foreign_key "nics", "networks"
  add_foreign_key "nics", "nodes"
  add_foreign_key "node_hadrwares", "node_models"
  add_foreign_key "node_hadrwares", "nodes"
  add_foreign_key "node_softwares", "nodes"
  add_foreign_key "node_softwares", "os_versions"
  add_foreign_key "node_softwares", "security_softwares"
  add_foreign_key "nodes", "users", column: "owner_id"
  add_foreign_key "os_products", "os_families"
  add_foreign_key "os_versions", "os_products"
end
