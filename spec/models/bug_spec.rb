require 'rails_helper'

RSpec.describe Bug do
  before { @bug = FactoryGirl.build(:bug) }
  
  subject { @bug }
  
  it { should respond_to(:app_id) }
  it { should respond_to(:number) }
  it { should respond_to(:status) }
  it { should respond_to(:priority) }
  
  it { should be_valid }
  
  it { should validate_inclusion_of(:status).in_array(Bug::STATUSES) }
  it { should validate_inclusion_of(:priority).in_array(Bug::PRIORITIES) }
end
