require 'rails_helper'

# On the right side of this RSpec.feature, write the test item name like "task management feature" (grouped by do ~ end)
RSpec.feature "Task management function", type: :feature do
  # In scenario (alias of it), write the processing of the test for each item you want to check.
  scenario "Test task list" do
     # Create two tasks in advance to use in the task list test
  Task.create!(name: 'test_task_01', details: 'testtesttest')
  Task.create!(name: 'test_task_02', details: 'samplesample')

  # visit to tasks_path (transition to task list page)
  visit tasks_path

  # write a test to verify that the string "" testtesttest "" samplesample "is included when accessing the task list page using have_content method

  

  expect(page).to have_content 'testtesttest'
  expect(page).to have_content 'samplesample'

  end

  scenario "Test task creation" do

  end

  scenario "Test task details" do

  end
end