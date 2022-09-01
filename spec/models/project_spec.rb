require 'rails_helper'
RSpec.describe Project, type: :model do 
  it { should have_many(:projects_users) }
  it { should have_many(:users).through (:projects_users)}

  it { should validate_presence_of(:job) }
end 