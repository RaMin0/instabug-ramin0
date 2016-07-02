require 'rails_helper'

RSpec.describe App do
  before { @app = FactoryGirl.build(:app) }
  
  subject { @app }
  
  it { should respond_to(:name) }
  it { should respond_to(:uuid) }
  it { should respond_to(:authentication_token) }
  
  it { should be_valid }
  
  it { should validate_presence_of(:name) }
end
