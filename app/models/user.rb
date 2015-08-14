require 'securerandom'
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	#Email must be uniquess, it is not case-sentitive, not allowed foo@email.com and Foo@email.com
	validates_uniqueness_of :email, :case_sensitive => false
	#Required fields
	validates :email,:password, presence: true
	before_create :set_auth_token, :normalize_user

	private

		def generate_api_key
		  loop do
		    token = SecureRandom.base64.tr('+/=', 'Qrt')
		    break token if User.where(api_token: token).empty?
		  end
		end

    def set_auth_token
      return if api_token.present?
      self.api_token = generate_api_key
    end

    #Save the email in downcase always.
    def normalize_user
    	self.email.downcase! if self.email
    end
end
