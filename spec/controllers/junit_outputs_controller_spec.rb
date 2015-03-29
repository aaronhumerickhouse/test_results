require 'rails_helper'

RSpec.describe JunitOutputsController, type: :controller do
  describe 'actions' do
    describe 'create' do
      it 'returns 200' do
        post :create, format: :json, 'junit_output' => {'output' => '<xml blob>'}
        expect(response.status).to eq 200
        expect(JunitOutput.last.output).to eq '<xml blob>'
      end
    end
  end
end


