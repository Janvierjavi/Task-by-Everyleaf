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


*This text will be italic*
_This will also be italic_

**This text will be bold**
__This will also be bold__

_You **can** combine them_