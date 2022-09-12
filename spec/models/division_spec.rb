require 'rails_helper'

RSpec.describe Division, type: :model do 
  it { should have_many(:users).dependent(:destroy) }

  it { should validate_presence_of(:title) }
end 