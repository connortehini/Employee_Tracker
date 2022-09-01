require 'rails_helper'

RSpec.describe User, type: :model do 
  it {should belong_to(:division)}
  it { should have_many(:projects_users) }
  it { should have_many(:projects).through (:projects_users)}

  it { should validate_presence_of(:name)}
end 