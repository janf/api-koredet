module Api::V1
  class UsersController < ApiController

    #before_action :authenticate_user!
    before_action :set_user, only: [:show, :update]


    # GET /v1/users
    def index
      #puts "Header: { uid: " + request.headers['uid'] + "}"
      #puts "Header: { access-token: " + request.headers['access-token'] + "}"

      render json: User.all
    end

    # GET /v1/users/{id}
    def show
      puts "Current tenant is: "  + current_tenant.to_s
      render json: User.find(params[:id]), include: 'account, user_account'  
    end

    def update
      #puts "Header: { uid: " + request.headers['uid'] + "}"
      #puts "Header: { access-token: " + request.headers['access-token'] + "}"    
      #puts "User uid:" + @user.uid
      @user.update(user_params)
      render json: @user # include: 'account' #, user_account.account'  
    end

    def user_accounts
      render json: UserAccount.where(user_id: params[:id])
    end

    protected

    def user_params
      params.require(:user).permit(:name, :nickname, :address, :zip_code,:city, :country, :phone_number)
    end

    def set_user
      @user = User.find(params[:id])
      puts "Found user " + @user.uid
    end


  end
end