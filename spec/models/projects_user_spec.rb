require 'rails_helper'
RSpec.describe ProjectsUser, type: :model do 
  it {should belong_to(:user).optional }
  it {should belong_to(:project).optional}
end 