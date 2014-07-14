# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page, :class => 'Pages' do
    name "MyString"
    link "MyString"
    category_list "MyText"
    is_published "MyString"
    can_post "MyString"
    likes 1
    location "MyString"
    phone "MyString"
    checkins "MyString"
    picture "MyString"
    cover "MyString"
    website "MyString"
    description "MyString"
    unread_message_count 1
    unread_notif_count 1
    unseen_message_count 1
    about "MyString"
    description_html "MyText"
    talking_about_count 1
    global_brand_parent_page "MyString"
    access_token "MyString"
    hours "MyString"
  end
end
