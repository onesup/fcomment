# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    cid 1
    message "MyText"
    raw_data "MyText"
    post nil
    user nil
  end
end
