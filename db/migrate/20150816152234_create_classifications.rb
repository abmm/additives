class CreateClassifications < ActiveRecord::Migration
  def change
    create_table :classifications do |t|
      t.integer :classification_id
      t.string 	:name,	null:false, :limit => 100

      t.timestamps null: false
    end
  end
end
