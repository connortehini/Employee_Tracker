require 'rails_helper'

RSpec.describe 'Projects', type: :request do 
  let!(:divisions) { create_list(:division, 10) }
  let(:division_id) {divisions.first.id}
  let!(:projects) { create_list(:project, 10 ) }
  let(:project_id) {projects.first.id}
  let(:super_admin) {create(:user, role: 3, division_id: division_id)}

  before { sign_in super_admin}

  describe 'GET /projects' do 
    before { get '/projects' }
    before {super_admin.projects_users.create!(project_id: project_id)}

    it 'returns projects' do 
      expect(json).not_to be_empty
    end 

    it 'return status code 200' do
      expect(response).to have_http_status(200)
    end  
  end 

  describe 'GET /projects/:id' do 
    before { get "/projects/#{project_id}"}

    context 'when the record exists' do 
      it 'returns the division' do 
        expect(assigns(:project)).to eq(projects.first)
      end 

      it 'returns status code 200' do 
        expect(response).to have_http_status(200)
      end 
    end 
  end 

  describe 'GET projects/new' do 
    before { get new_project_path }

    it 'returns a response' do 
      expect(response.body).not_to be_empty
    end 

    it 'creates a new division' do 
      expect(assigns(:project)).to be_a(Project)
    end 
  end 

  describe 'POST /projects' do 
    let(:valid_attributes) { attributes_for(:project)}

    context 'when the request is valid' do 
      before { post '/projects', params: {project: valid_attributes}}

      it 'creates a project' do 
        expect(assigns(:project)).to eq(Project.last)
      end 

      it 'redirects correctly' do 
        expect(response).to redirect_to(projects_path)
      end
    end 

    context 'when the request is invalid' do 
      before { post '/projects', params: {project: {id: 0}}}

      it 'it renders new' do 
        expect(response).to render_template("projects/new")
      end 
    end 
  end 

  describe 'DELETE /projects/:id' do
    context 'when the project exists' do  
      before {delete "/projects/#{project_id}"}

      it 'deletes a division' do 
        expect((Project.count)).to eq(9)
      end 

      it 'redirects to root path' do 
        expect(response).to have_http_status(302)
      end
    end  

    context 'when the division does not exist' do 
      it ' returns http status code 404' do 
        delete "/divisions/0"
        expect(response).to have_http_status(404)
      end 
    end 
  end  
end 