# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_190_824_000_654) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'cels', force: :cascade do |t|
    t.bigint 'stat_id'
    t.string 'brand'
    t.string 'model'
    t.string 'imei1'
    t.string 'imei2'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['stat_id'], name: 'index_cels_on_stat_id'
  end

  create_table 'chips', force: :cascade do |t|
    t.bigint 'stat_id'
    t.string 'operator'
    t.string 'ddd'
    t.string 'phoneNumber'
    t.money 'value', scale: 2
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['stat_id'], name: 'index_chips_on_stat_id'
  end

  create_table 'companies', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'equips', force: :cascade do |t|
    t.bigint 'notebook_id'
    t.bigint 'chip_id'
    t.bigint 'cel_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['cel_id'], name: 'index_equips_on_cel_id'
    t.index ['chip_id'], name: 'index_equips_on_chip_id'
    t.index ['notebook_id'], name: 'index_equips_on_notebook_id'
  end

  create_table 'notebooks', force: :cascade do |t|
    t.bigint 'stat_id'
    t.string 'brand'
    t.string 'model'
    t.string 'serialNumber'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['stat_id'], name: 'index_notebooks_on_stat_id'
  end

  create_table 'owners', force: :cascade do |t|
    t.string 'name'
    t.string 'cpf'
    t.string 'email'
    t.bigint 'sector_id'
    t.bigint 'company_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['company_id'], name: 'index_owners_on_company_id'
    t.index ['sector_id'], name: 'index_owners_on_sector_id'
  end

  create_table 'possesions', force: :cascade do |t|
    t.bigint 'owner_id'
    t.bigint 'equip_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['equip_id'], name: 'index_possesions_on_equip_id'
    t.index ['owner_id'], name: 'index_possesions_on_owner_id'
  end

  create_table 'sectors', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'stats', force: :cascade do |t|
    t.string 'description'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'cels', 'stats'
  add_foreign_key 'chips', 'stats'
  add_foreign_key 'equips', 'cels'
  add_foreign_key 'equips', 'chips'
  add_foreign_key 'equips', 'notebooks'
  add_foreign_key 'notebooks', 'stats'
  add_foreign_key 'possesions', 'equips'
  add_foreign_key 'possesions', 'owners'
end
