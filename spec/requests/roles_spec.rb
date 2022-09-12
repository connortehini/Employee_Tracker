require 'rails_helper'

RSpec.describe 'Projects', type: :request do 
  let!(:divisions) { create_list(:division, 10) }
  let(:division_id) {divisions.first.id}
  let!(:projects) { create_list(:project, 10 ) }
  let(:project_id) {projects.first.id}
  let(:super_admin) {create(:user, role: 3, division_id: division_id)} 

  before {sign_in super_admin}

  describe 'GET /roles' do 
    before { get '/roles'}

    it 'returns roles' do 
      expect(response).not_to be be_empty
    end 
  end 
end  