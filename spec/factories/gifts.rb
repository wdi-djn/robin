 # create_table "gifts", force: :cascade do |t|
 #    t.string   "title"
 #    t.text     "description"
 #    t.decimal  "price"
 #    t.string   "gift_url"
 #    t.datetime "due_date"
 #    t.string   "recipient"
 #    t.integer  "user_id"
 #    t.string   "hashed_id"
 #    t.datetime "created_at",  null: false
 #    t.datetime "updated_at",  null: false
 #  end

FactoryGirl.define do
  factory :gift do
  	title { FFaker::Lorem.sentence(5)}
  	description { FFaker::Lorem.paragraph}
  	price { FFaker::}
  	gift_url { FFaker::}
  	due_date { FFaker::}
  	recipient { FFaker::}
  	user_id { FFaker::}
  	hashed_id { FFaker::}
  end
end
