module ApplicationHelper
	def toxicity_to_s id
		str = case id
			when 0 then "INOFENSIVO";
			when 1 then "PRECAUCIÓN";
			when 2 then "PELIGROSO";
		end
		str
	end
end
