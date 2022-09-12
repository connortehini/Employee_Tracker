# require 'rails_helper'


# describe DivisionPolicy do
#   subject { described_class.new(user, division) }
#   let!(:divisions) { create_list(:division, 10) }
#   let(:division_id) {divisions.first.id}
#   # let(:division) {Division.create}

#   context 'being a employee' do
#     let(:user) { create(:user, role: "employee") }
    
#     it { is_expected.to permit_action(:show) }
#     it { is_expected.to forbid_action(%i[new create edit update destroy])}
#   end 
# end  