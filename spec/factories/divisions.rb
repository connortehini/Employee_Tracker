FactoryBot.define do 
  factory :division do 
    title { Faker::Company.industry }
  end 
end 
