require 'rails_helper'

describe Api::V1::AppsController do
  let(:valid_attributes)   { FactoryGirl.attributes_for(:app) }
  let(:invalid_attributes) { {} }
  
  describe 'POST #create' do
    context 'with valid params' do
      before :each do
        post :create, { app: valid_attributes }
      end

      it 'creates a new app' do
        expect { post :create, { app: valid_attributes }}.to change(App, :count).by(1)
      end

      it 'assigns a newly created app as @app' do
        expect(assigns[:app]).to be_a(App)
        expect(assigns[:app]).to be_persisted
      end
      
      it 'creates an app with the correct attributes' do
        expect(assigns[:app].attributes.symbolize_keys).to include(valid_attributes)
      end
      
      it 'renders an app json with the correct attributes' do
        expect(json_response).to have_key(:name)
        expect(json_response).to have_key(:uuid)
        expect(json_response).to have_key(:token)
      end

      it { should respond_with 201 }
    end

    context 'with invalid params' do
      before :each do
        post :create, { app: invalid_attributes }
      end

      it 'assigns a newly created but unsaved app as @app' do
        expect(assigns[:app]).to be_a_new(App)
      end
      
      it 'renders an error json with a message about the invalid attributes' do
        expect(json_response).to have_key(:error)
        expect(json_response[:error]).to match(/name/i)
      end

      it { should respond_with 422 }
    end
  end
end
