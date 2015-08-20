class Classification < ActiveRecord::Base
	validates_uniqueness_of :name, :classification_id
end
