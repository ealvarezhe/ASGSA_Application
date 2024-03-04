require 'rails_helper'

# RSpec.describe MembersController, type: :controller do
#   describe 'PATCH update' do
#     let(:member) { create(:member) } # Assuming you have a factory for Member model

#     context 'with invalid attributes' do
#       it 'renders the edit template with unprocessable_entity status' do
#         patch :update, params: { id: member.id, member: { first_name: '' } }
#         expect(response).to render_template(:edit)
#         expect(response).to have_http_status(:unprocessable_entity)
#       end

#       it 'includes errors in the JSON response' do
#         patch :update, params: { id: member.id, member: { first_name: '' }, format: :json }
#         expect(JSON.parse(response.body)).to include('errors')
#       end
#     end
#   end
# end
