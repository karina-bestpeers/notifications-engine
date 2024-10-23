FactoryBot.define do
  factory :notification, class: 'NotificationsEngine::Notification' do
    status { ['Sent', 'Pending', 'Failed'].sample }
    message { "Test message" }
    user_id { Faker::Number.between(from: 1, to: 1000) }
    channel { 'in-app' }
    user_details do
      {
        name: Faker::Name.name,
        email: Faker::Internet.email,
        phone_number: "1234567890"
      }
    end
  end
end
