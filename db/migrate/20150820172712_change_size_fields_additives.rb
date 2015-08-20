class ChangeSizeFieldsAdditives < ActiveRecord::Migration
  def change
  	change_table :additives do |t|
  		t.change :code,					:string,	:limit => 20, null:false
  		t.change :name,					:string,	:limit => 150, null:false
  		t.change :description,	:text, 		:limit => nil
  		t.change :use, 				  :text, 		:limit => nil
  		t.change :effects,			:text, 		:limit => nil
		end
  end
end
