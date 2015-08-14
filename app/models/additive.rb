class Additive < ActiveRecord::Base
	belongs_to :user

	# validates :user_id, :contact_id, :type_cd, :quantity, :description, presence: true

	# as_enum :type, 				[:my_debt, :my_debtor],		 	prefix: true
	# as_enum :status, 			[:pending, :sincronized], prefix: true
	# as_enum :created_by,	[:web, :api], 						prefix: true


end
