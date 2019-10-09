class Changecolumn < ActiveRecord::Migration[5.2]
  
  change_column :tasks, :name, :string, null: false
  change_column :tasks, :details, :text, null: false
  change_column :tasks, :arrive, :datetime, null: false
  change_column :tasks, :leave, :datetime, null: false 
  change_column :tasks, :status, :string, null: false 
  change_column :tasks, :priority, :integer, null: false 
end
