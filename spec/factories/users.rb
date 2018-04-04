FactoryBot.define do
  factory :user do
    first_name "Billy"
    last_name "Bob"
    email "billy@example.com"
    password "password"
    password_confirmation "password"
    company "Turing"
  end
end
