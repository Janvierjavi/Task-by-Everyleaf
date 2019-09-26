<<<<<<< HEAD
FactoryBot.define do

<<<<<<< HEAD
    # Name the test data to be created "task"
    # (If you name test data that matches the class name that actually exists, test data of that class will be created automatically)
    factory :task do
      name { 'test' }
      details { 'hello guys' }
    end
  
    # Name the test data to be created as "second_task"
    # (If you want to name a non-existent class name, optionally specify "Please make test data of this class")
    factory :second_task, class: Task do
      name { 'Default title 2 created by Factory' }
      details { 'Default content 2 created by Factory' }
=======
    factory :task do
      name  'test' 
      details  'hello guys' 
    end
  
    
    factory :second_task, class: Task do
      name 'Default title 2 created by Factory' 
      details  'Default content 2 created by Factory' 
>>>>>>> name1
    end
=======
FactoryBot.define do


    factory :task do
      name  'test' 
      details  'hello guys' 
    end
  
    
    factory :second_task, class: Task do
      name 'Default title 2 created by Factory' 
      details  'Default content 2 created by Factory' 

    end
>>>>>>> 5185eb84c6b958124ffe25277db9e98c71e5a053
  end