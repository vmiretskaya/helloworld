
require 'rails_helper'

describe Product do

context "The raitings calculation" do
	
	before do
	  
	 # @product = Product.create(:name => "race bike")
	 # @user    = User.create(:email => "a@a.com",:password=>'1')

 	  @product = FactoryGirl.create(:product_with_comment)
	 	 
	  
	  #@product.comments.create(:rating => 1, :user => @user, :body => "qqqqq")
	  #@product.comments.create(:rating => 3, :user => @user, :body => "qqqqq")
	  #@product.comments.create(:rating => 5, :user => @user, :body => "qqqqq")
	  	  
	end

	it "should returns the average rating of all comments" do
		expect(@product.average_rating).to eq 3
	end

end	

context "Product with description but without name" do
      before do
        @product = Product.create(:name => nil, description: "bike")
      end
      
     it "Should not pass validation without name" do
       expect(@product).not_to be_valid
     end 
end  

end