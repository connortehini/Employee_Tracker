require 'rails_helper'

RSpec.describe 'Divisions', type: :request do 
  let!(:divisions) { create_list(:division, 10) }
  let(:division_id) {divisions.first.id}
  # let!(:employee) { create(:user, role: employee, division_id: division_id)}

  describe 'GET /divisions' do 
    before { get '/divisions' }
    

    it 'returns divisions' do 
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end 

    it 'returns status code 200' do 
      expect(response).to have_http_status(200)
    end 
  end

  describe 'GET /divisions/:id' do 
    before { get "/divisions/#{division_id}" }

    context 'when the record exists' do 
      it 'returns the division' do 
        # sign_in employee
        expect(json).not_to be_empty
        expect(json['id']).to eq(todo_id)
      end 

      it 'returns status code 200' do 
        expect(response).to have_http_status(200)
      end 
    end 

    context 'when the record does not exist' do 
      let (:division_id) {100}

      it 'returns status code 404' do 
        expect(response).to have_http_status(404)
      end 

      it 'returns a not found message' do 
        expect(response.body).to match(/Couldn't find Division/)
      end 
    end 
  end 

end 