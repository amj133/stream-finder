FactoryBot.define do
  factory :user do
    name "Billy"
    email "billy@example.com"
    password "password"
    password_confirmation "password"
    company "Turing"
  end
end
