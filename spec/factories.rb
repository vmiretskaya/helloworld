# This will guess the User class
FactoryGirl.define do
  
  factory :user do
    sequence :first_name do |n| 
      "John#{n}"
    end  
    sequence :last_name  do |n| 
      "Doe#{n}"
    end  
    password 123456789
    password_confirmation do |u| 
      u.password
    end  
    sequence :email do |n| 
      "#{first_name}.#{last_name}@exm.com"
    end  
    admin false
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    first_name "Admin"
    last_name  "User"
    admin      true
  end

  #Product 
  factory :product do
    sequence :name do |n| 
      "Test product#{n}"
    end  
    id "100"
    price "100"
    color "red"
    description "Test"
    
    factory :product_with_comment do
 
      transient do
        comment_count 3
      end

      #after(:create) do |product, evaluator|
       # FactoryGirl.create_list(:comment, evaluator.comment_count, product: product, rating: 1)
      after(:create) do |product|
        FactoryGirl.create(:comment, product: product, rating: 1)
        FactoryGirl.create(:comment, product: product, rating: 3)
        FactoryGirl.create(:comment, product: product, rating: 5)
        product.reload
      end 
    end

  end

  #Comment 
  factory :comment do
    body "test"

   association :product, factory: :product
   association :user, factory: :user, last_name: "Writely"
    
   # user_id 1
   

  end

end
