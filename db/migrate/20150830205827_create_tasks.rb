class CreateTasks < ActiveRecord::Migration
  def change
  	create_table :tasks do |t|
  		t.string :text, null: false
  		t.integer :list_id
  		t.boolean :completed
		
		t.timestamps
	end	
  end
end
