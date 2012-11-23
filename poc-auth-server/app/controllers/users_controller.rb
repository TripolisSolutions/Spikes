class UsersController < ApplicationController
  caches_action :show, :index

  # GET /users.json
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    render json: @user
  end


  # POST /users.json
  def create
    #client = Client.find_by_id(params[:user]['client_id'])
    @user = User.new(params[:user])
    if @user.save
      expire_action action: "index"
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      expire_action action: "index"
      expire_action action: "show", id: @user.id
      head :no_content
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    expire_action action: "index"
    expire_action action: "show", id: @user.id

    head :no_content
  end
end
