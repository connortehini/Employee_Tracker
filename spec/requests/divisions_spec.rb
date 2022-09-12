require 'rails_helper'

RSpec.describe 'Divisions', type: :request do 
  let!(:divisions) { create_list(:division, 10) }
  let(:division_id) {divisions.first.id}
  let(:super_admin) { create(:user, role: 3, division_id: division_id)}
  # before { binding.pry }
  before  { sign_in super_admin }

  describe 'GET /divisions' do 
    before { get '/divisions' }
    

    it 'returns divisions' do 
      expect(response).not_to be_empty
    end 

    it 'returns status code 200' do 
      expect(response).to have_http_status(200)
    end 
  end
  
  describe 'GET /divisions/:id' do 
    before { get "/divisions/#{division_id}" }

    context 'when the record exists' do       
      it 'returns the division' do 
        expect(assigns(:division)).to eq(divisions.first)
      end 

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end 
    end 
  end 

  describe 'divisions/new' do 
    before { get new_division_path }

    it 'returns a response' do 
      expect(response.body).not_to be_empty
    end 

    it 'creates a new division' do 
      expect(assigns(:division)).to be_a(Division)
    end 

  end 

  describe 'POST /divisions' do 
    let(:valid_attributes) { attributes_for(:division)}

    context 'when the request is valid' do 
      before { post '/divisions', params: {division: valid_attributes}} 

      it 'creates a division' do 
        
        expect(assigns(:division)).to eq(Division.last)
      end 

      it 'it redirects correctly' do 
        expect(response).to redirect_to(division_path(Division.last.id))
      end 
    end 
  end 
  context 'when the request is invalid' do 
    before { post '/divisions', params: {division: {id: 0 }}}

    it 'it renders new' do 
      expect(response).to render_template("divisions/new")
    end
  end 

  describe 'DELETE /divisions/:id' do 
    context 'when the division exists' do  
      before { delete "/divisions/#{division_id}" }  

      it 'deletes a division' do 
        expect((Division.count)).to eq(9)
      end 

      it 'it redirects to root path' do 
        expect(response).to have_http_status(302)
      end  
    end
    context 'when the division does not exist' do
      it 'returns a http staus code 404' do
        delete "/divisions/0"
        expect(response).to have_http_status(404)
      end
    end 
  end 
end 