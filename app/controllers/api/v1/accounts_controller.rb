module Api::V1
  class AccountsController < ApiController

    before_action :authenticate_user!
    before_action :set_user, only: [:show, :update]


    def index
      render json: Account.all
    end

    # GET /v1/users/{id}
    def show
      #puts "Current tenant is: "  + current_tenant.to_s
      render json: Acount.find(params[:id])
    end

    def update
      puts "Header: { uid: " + request.headers['uid'] + "}"
      puts "Header: { access-token: " + request.headers['access-token'] + "}"    
      puts "User uid:" + @user.uid
      @account.update(account_params)
      render json: @user  
    end

    def create
      @account = Account.new(account_params)

      @account.account_active = true

      if @account.save
        format.json { render json: @item, status: :created }
      else
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end

    def add_user_to_account(email)


    end



    protected

    def account_params
      params.require(:account).permit(:account_name)
    end

    def set_account
      @account = Account.find(params[:id])
      puts "Found account: " + @account.account_name
    end

    def create_user_account(account_id, is_admin)
      #See if relation already exists
      # puts "User.id: " + current_user.id.to_s + " , Account ID: " + account_id.to_s
      exist_user_account = UserAccount.unscoped.where(user_id: current_user.id, account_id: account_id)
      if exist_user_account.length > 0 
         return false
      end

      # Do the insert directly by SQL to circumvent default scope set by Acts_as_tenant
      sql = "INSERT INTO  user_accounts(account_id, user_id, account_admin, created_at, updated_at) VALUES(" 
      sql = sql + account_id.to_s  
      sql = sql + ", " + current_user.id.to_s
      sql = sql + ", " + is_admin.to_s
      sql = sql + ", localtimestamp, localtimestamp)"
      ActiveRecord::Base.connection.execute(sql)   
      return true
    end  

  end
end