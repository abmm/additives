module ApplicationHelper
	def toxicity_to_s id
		str = case id
			when 0 then "INOFENSIVO";
			when 1 then "PRECAUCIÓN";
			when 2 then "PELIGROSO";
		end
		str
	end

	#Encrypt data using JWT and return it as json
	# Input:  a hash
	# Output: {'payload' => 'xjksgxkjabxkjasbjkxbjasbxjabsjxkbasxkajs'}
	def encrypt_json payload
		{ 'payload' => (JWT.encode payload, Settings.hmac_secret, 'HS256') }.to_json
	end

end
