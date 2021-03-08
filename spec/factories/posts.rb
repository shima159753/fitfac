FactoryBot.define do
  factory :post do
    name                     { 'test' }
    postal_code              { '123-4567' }
    prefecture_id            { 2 }
    city                     { 'test' }
    address                  { 'test' }
    building_name            { 'test' }
    price                    { 'test' }
    bus_hours                { 'test' }
    text                     { 'test' }
    item                     { 'test' }
    caution                  { 'test' }
    association :user

    after(:build) do |post|
      post.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
