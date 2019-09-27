require 'rails_helper'

RSpec.describe Task, type: :model do

  it "Validation does not pass if the title is empty" do
    task = Task.new(name: '')
    expect(task).not_to be_valid
  
  end

  it "Validation does not pass if content is empty" do
    task = Task.new(details: '')
    expect(task).not_to be_valid
    # Describe the contents here
  end

  it "validation passes If content is described in title and content" do
    # Describe the contents here
    task = Task.new( name:'hello', details: 'yup' )
    expect(task).not_to be_valid
  end
end