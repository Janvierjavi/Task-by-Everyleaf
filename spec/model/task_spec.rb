require 'rails_helper'

RSpec.describe Task, type: :model do

  it "Validation does not pass if the name is empty" do
    task = Task.new(name:'', details: 'yup')
    expect(task).not_to be_valid
  
  end

  it "Validation does not pass if details is empty" do
    task = Task.new(name:'hello', details: '')
    expect(task).not_to be_valid
    # Describe the contents here
  end

  it "validation passes If details is described in name and details" do
    # Describe the contents here
    task = Task.new( name:'hell', details: 'detaissssssss' )
    expect(task).not_to be_valid
  end
end