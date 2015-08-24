payload = json.cache! ['v1', @additives], expires_in: 10.minutes do
	json.array! @additives do |additive|
		json.extract! additive, :id,:code,:name,:description,:use,:effects
		
		json.classification additive.classification.name	if additive.classification 
		json.origin 				additive.origin.name					if additive.origin
		json.toxicity				toxicity_to_s(additive.toxicity)
	end
end

return encrypt_json(payload) if encrypted