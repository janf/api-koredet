FactoryBot.define do

    factory :account do
       account_name "Sam Rubys Account"
    end

    factory :user do
      association :current_account, factory: :account
    	email "aactest@hh.com"
      name "Factory Test user"
      password_confirmation "rubymyruby"
      password "rubymyruby"
    end


    factory :item do
        account_id 0
        name "My Factory Item"
        image_url ""
        description "MyText"
    end

    factory :location do
        account_id 0
        location_name "Boden"
    end

    factory :inventory do
      account_id 0
      item_id 0
      location_id 0
      qty 3
    end

end
