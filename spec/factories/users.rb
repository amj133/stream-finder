FactoryBot.define do
  factory :user do
    first_name "Billy"
    last_name "Bob"
    email "billy@example.com"
    company "Turing"
    slug "billy"
    before(:create) do |user|
      user.create_app_credential(password: "password")
    end
  end
end
