FactoryBot.define do
  factory :notification, class: 'NotificationsEngine::Notification' do
    status { ['Sent', 'Pending', 'Failed'].sample }
    message { Faker::Lorem.sentence(word_count: 5) }
    user_id { Faker::Number.between(from: 1, to: 1000) }
    user_details { { title: Faker::Job.title } }
  end
end
