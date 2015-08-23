class Origin < ActiveRecord::Base
	after_save :expire_cache

	private
		def expire_cache
			Rails.cache.clear
		end
end
