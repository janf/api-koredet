module Api::V1
  class ApiController < ApplicationController
    #before_action :authenticate_user!
    respond_to :json
    wrap_parameters format: []
  end
end