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


* how to deploy app of ruby on heroku
  * create app on localhost and see if it works.
  * login on the heroku by using this command if u use vagrant : heroku login --interactive 
  * then run: heroku create 
  * run: git add .
  * run: git commit -m "messaeg"
  * run: git push heroku master 
  * go to ur heroku account see the name u get the time u creates it. 
  * click on open and u start use ur app

   **version of the framework**
   _rails -v:Rails 5.2.3_
    _ruby -v:ruby 2.6.3p62_
    
