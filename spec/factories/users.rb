FactoryBot.define do 
  factory :user do 
    email {Faker::Internet.email}
    password {Faker::Internet.password(min_length: 6)}
    name {Faker::Name.name}

    role {'hr_manager'}
  end 
end
