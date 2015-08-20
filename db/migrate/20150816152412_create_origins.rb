class CreateOrigins < ActiveRecord::Migration
  def change
    create_table :origins do |t|
      t.integer :origin_id
      t.string 	:name, null:false, :limit => 100

      t.timestamps null: false
    end
  end
end
