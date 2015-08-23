class Additive < ActiveRecord::Base
	belongs_to :user
  belongs_to :origin, primary_key: "origin_id"
  belongs_to :classification, primary_key: "classification_id"
  after_save :expire_cache

	private
		def expire_cache
			Rails.cache.delete("additives#index")
		end
end
