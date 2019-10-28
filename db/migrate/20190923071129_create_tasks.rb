class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :details
      t.datetime :arrive
      t.datetime :leave
      t.string :status
      t.integer :priority
      t.timestamps
    end
  end
end
