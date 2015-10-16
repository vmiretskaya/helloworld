class Product < ActiveRecord::Base
	has_many :orders
	has_many :comments

	validates :name, presence: true
	validates_format_of :price, :with => /\A\d+(?:\.\d{0,2})?\z/
	
	def average_rating
  		comments.average(:rating).to_f
	end

end
