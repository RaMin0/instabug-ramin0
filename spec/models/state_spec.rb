require 'rails_helper'

RSpec.describe State do
  before { @state = FactoryGirl.build(:state) }
  
  subject { @state }
  
  it { should respond_to(:bug_id) }
  it { should respond_to(:device) }
  it { should respond_to(:os) }
  it { should respond_to(:memory) }
  it { should respond_to(:storage) }
  
  it { should be_valid }
end
