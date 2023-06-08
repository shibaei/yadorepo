FactoryBot.define do
  factory :post do
    title {Faker::Lorem.sentence}
    place_id { Faker::Number.between(from: 2, to: 49) }
    hotel {Faker::Company.name}
    room { 'てすと' }
    check_in { Faker::Date.in_date_period}
    check_out{ Faker::Date.in_date_period }
    text{Faker::Lorem.sentence}
    association :user

    after(:build) do |post|
      post.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
