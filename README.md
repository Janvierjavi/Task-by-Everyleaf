user 

column_name| data_type
-----------|-----------
user_id    | integer
name|string 
email|string 
birth_day|integer 
location|valchar 

task 

column_name| data_type
-----------|-----------
task_id|integer 
task_type|string 
task_name|string 
user|reference


label

column_name| data_type
-----------|-----------
 label_id|integer 
 label_title|string 
 label_type|string
 task|reference


