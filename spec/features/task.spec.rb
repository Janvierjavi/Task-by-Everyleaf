require 'rails_helper'
RSpec.feature "Task management function", type: :feature do
  background do
  user =  User.create(name: 'janvier',
                             email: 'janvier@gmail.com',
                             password: 'password',
                             password_confirmation: 'password')
    visit new_session_path
    fill_in 'email', with: 'janvier@gmail.com'
    fill_in 'password', with: 'password'
        visit tasks_path
    @user = User.first
    # current_user.should == @user
    Task.create!(name: 'test', details: 'hello guys', status:'done',user_id: @user.id, priority:'High', arrive: '2019-09-25 18:02:00 +0900' , leave: '2019-09-25 18:05:00 +0900')
  end
  scenario "Test task list" do
    login_as(current_user)

  visit tasks_path
  end
  scenario "Test task creation" do
        visit new_task_path
        Task.create!(name: 'test', details: 'hello guys', status:'done',user_id: @user.id, priority:'High', arrive: '2019-09-25 18:02:00 +0900' , leave: '2019-09-25 18:05:00 +0900')
  click_button 'create task'
         visit tasks_path
  end
  scenario "Test task show" do
    task1=Task.first
 visit task_path(id: task1.id)
 expect(page).to have_content('hello guys')
    end
  scenario "Test whether tasks are arranged in descending order of creation date" do
 Task.all.order(' created_at desc')
 visit tasks_path
 expect(page).to have_content 'test'
  end
  scenario "Test task for sorting by leaving time " do
    visit new_session_path
        fill_in 'email', with: 'test@gmail.com'
      fill_in "Password", with: '1234567'
      click_button "Log in"
      visit tasks_path
    # click_link "leave time"
    visit tasks_path
    assert Task.all.order("leave DESC")
  end
  scenario "Test sorting by high priority" do
    visit tasks_path
    # click_link"High priority"
    assert Task.all.order("priority DESC")
    end
    scenario "Test search by title" do
      visit tasks_path
      expect(page).to have_content 'test'
    end
    scenario "Test search by status" do
      visit tasks_path
      expect(page).to have_content 'done'
    end
    scenario "Test search by both title and status" do
      visit tasks_path
      expect(page).to have_content 'test'
      expect(page).to have_content 'done'
    end

end
