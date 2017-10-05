FactoryGirl.define do
    factory :user do
    	id "99"
    	email "aabb@hh.de"
        password "rubymyruby"
        password_confirmation "rubymyruby"
    end


    factory :account do
    	id "99"
    	account_name "Sam Rubys Account"
    end
end