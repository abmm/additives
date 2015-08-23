json.array! @additives do |additive|
	json.extract! additive, :id,:code,:name,:description,:use,:effects

	json.classification additive.classification.name
	json.origin 				additive.origin.name
	json.toxicity				toxicity_to_s(additive.toxicity)

end
