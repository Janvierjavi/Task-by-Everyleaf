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

  it "validation passes If details is described in status" do
    # Describe the contents here
    task = Task.new( status: 'in progress' )
    expect(task).not_to be_valid
  end
  it "validation passes If details priority" do
    # Describe the contents here
    task = Task.new( priority: 'Low' )
    expect(task).not_to be_valid
  end

  it "validation passes If details is described  arrive time and leave time" do
    # Describe the contents here
    task = Task.new( arrive: '2019-09-25 18:02:00 +0900' , leave: '2019-09-25 18:05:00 +0900' )
    expect(task).not_to be_valid
  end

end