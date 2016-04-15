class Product < ActiveRecord::Base
	has_many :orders
	has_many :comments
	has_and_belongs_to_many :colors

	validates :name, presence: true
	validates_format_of :price, :with => /\A\d+(?:\.\d{0,2})?\z/
	
	def average_rating
  		comments.average(:rating).to_f
	end


	#def view_counter(id)
	#	current_id = $redis.get id;
	#	if current_id == nil
	#		$redis.set id 0;
	#	end	
	#	$redis.incr id;

	#end	

	#def get_views_product(id)
	#	$redis.get id;	
	#end	

end
