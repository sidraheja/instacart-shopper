class Shopper < ActiveRecord::Base
	validates :email, uniqueness: { message: 'Email Exists!' }
  	scope :by_email, -> (email) { where(email: email) if email.present? }
end