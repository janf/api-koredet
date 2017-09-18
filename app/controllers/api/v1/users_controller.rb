module Api::V1
  class UsersController < ApiController

    # GET /v1/users
    def index
      puts "Header: { uid: " + request.headers['uid'] + "}"
      puts "Header: { access-token: " + request.headers['access-token'] + "}"

      render json: User.all
    end

    # GET /v1/users/{id}
    def show
      render json: User.find(params[:id])
    end

  end
end