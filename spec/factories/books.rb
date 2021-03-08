FactoryBot.define do
  factory :book do
    start_time            { '2021-02-21 22:55:00' }
    end_time              { '2021-02-21 23:55:00' }
    price                 { 1000 }
    memo                  { 'test' }
    capacity              { 'test' }

    association :user
    association :post
  end
end
