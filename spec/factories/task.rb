FactoryBot.define do


    factory :task do
      name  'test' 
      details  'hello guys' 
    end
  
    
    factory :second_task, class: Task do
      name 'Default title 2 created by Factory' 
      details  'Default content 2 created by Factory' 

    end
  end