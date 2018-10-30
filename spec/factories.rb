FactoryBot.define do



    factory :user do
    	#id "99"
    	email "aabb@hh.de"
        current_account_id 2
        password "rubymyruby"
        password_confirmation "rubymyruby"
    end


    factory :account do
    		account_name "Sam Rubys Account"
    end

    factory :item do
        account
        name "MyString"
        image_url ""
        description "MyText"
    end

    factory :location do
        account
        location_name "Boden"
    end

    factory :inventory do
      account
      item
      location
      qty 3
    end

end
