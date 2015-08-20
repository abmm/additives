class ChangeColumnsAdditives < ActiveRecord::Migration
	
  def change
  	change_table :additives do |t|
  		t.rename :classification, :classification_id
  		t.rename :origin, 				:origin_id
  		t.remove :trans
		end
  end
end
