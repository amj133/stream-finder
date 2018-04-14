FactoryBot.define do
 factory :project do
   sequence(:name) { |n| "Project #{n}" }
   huc "01234567"
 end
end
