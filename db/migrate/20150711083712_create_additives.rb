class CreateAdditives < ActiveRecord::Migration
  def change
    create_table :additives do |t|
      t.string    :code,            null:false, :limit => 6
      t.string    :name,            null:false, :limit => 100
      t.integer   :classification,  null:false
      t.integer   :origin,          null:false
      t.string    :description,	    null:false, :limit => 400
      t.string    :use,		          :limit => 400	          
      t.string    :effects,		      :limit => 400       
      t.integer   :toxicity,        null:false
      t.integer   :trans,           null:false    

      t.timestamps null: false
    end
  end
end