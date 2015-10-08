require 'rails_helper'

describe User do
  context "User email present" do
    before { @user = FactoryGirl.build :user }
    
    it "Should not pass validation without email" do
    	expect(@user.email).not_to be_empty
    end	

  end


end