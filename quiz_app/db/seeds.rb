# Examples:
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# ========================
# create_table "users", force: :cascade do |t|
#   t.boolean  "is_instructor",   default: false, null: false
#   t.string   "f_name",                          null: false
#   t.string   "l_name",                          null: false
#   t.string   "email",                           null: false
#   t.string   "password_digest",                 null: false
#   t.boolean  "is_active",       default: true,  null: false
#   t.datetime "created_at"
#   t.datetime "updated_at"
# end

user = User.create({f_name:})

