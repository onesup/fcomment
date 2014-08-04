# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game do
    post nil
    user nil
    page nil
    title "MyString"
    start_time "2014-08-04 14:20:28"
    finish_time "2014-08-04 14:20:28"
    play_type "MyString"
    players_count 1
  end
end
