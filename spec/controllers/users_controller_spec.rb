require 'rails_helper'

describe UsersController, :type => :controller do

  before do
    @user = User.create(:email => "example@example.com",:password=>'123456789')
  end

  describe "GET #show" do
     context "User is logged in" do
      before do
        sign_in @user
      end

      it "loads correct user details" do
        get :show, id: @user.id
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq @user
      end

     end

     context "No user is logged in" do
       it "redirects to login" do
         get :show, id: @user.id  
         expect(response).to redirect_to(root_path)
       end
     end
  
  end

before do
      @user2 = User.create!(:email => "abc@abc.com", :password => "123456789")
   end
    
    context "GET #show user2" do
      before do
        sign_in @user #sign in user1
      end
      
      it "user1 cannot access user2 #show" do
        get :show, id: @user2.id
        expect(response).to redirect_to(root_path)
      end
    
    end
    

end