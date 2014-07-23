# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    pid 1
    message "MyText"
    raw_data "MyText"
    page nil
    user nil
  end
end
