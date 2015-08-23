class Classification < ActiveRecord::Base
	validates_uniqueness_of :name, :classification_id
	after_save :expire_cache

	private
		def expire_cache
			Rails.cache.delete("additives#index")
		end
end
