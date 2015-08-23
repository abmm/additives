class Additive < ActiveRecord::Base
	belongs_to :user
  belongs_to :origin, primary_key: "origin_id"
  belongs_to :classification, primary_key: "classification_id"
  after_save :expire_cache

  #WillPaginate default size
	self.per_page = 10

	private
		def expire_cache
			#Rails.cache.delete("additives#index")
			#TODO: Refactor this code, now we have cache patters for pages like:
			# cache#index_page,cache#index_page1, cache#index_page2, cache#index_page3
			# we should expire only the affected one. 
			Rails.cache.clear
		end
end
