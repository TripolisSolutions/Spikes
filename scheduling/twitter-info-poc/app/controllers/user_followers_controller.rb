class UserFollowersController < ApplicationController
  before_filter :login_required
  
  # GET /user_followers
  # GET /user_followers.json
  def index
    @user_followers = UserFollower.for_user(current_user_id).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_followers }
    end
  end

  # GET /user_followers/1
  # GET /user_followers/1.json
  def show
    @user_follower = UserFollower.for_user(current_user_id).find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_follower }
    end
  end

  # GET /user_followers/new
  # GET /user_followers/new.json
  def new
    @user_follower = UserFollower.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_follower }
    end
  end

  # GET /user_followers/1/edit
  def edit
    @user_follower = UserFollower.for_user(current_user_id).find(params[:id])
  end

  # POST /user_followers
  # POST /user_followers.json
  def create
    @user_follower = UserFollower.new(params[:user_follower])
    @user_follower.user_id = current_user_id

    respond_to do |format|
      if @user_follower.save
        format.html { redirect_to @user_follower, notice: 'User follower was successfully created.' }
        format.json { render json: @user_follower, status: :created, location: @user_follower }
      else
        format.html { render action: "new" }
        format.json { render json: @user_follower.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_followers/1
  # PUT /user_followers/1.json
  def update
    @user_follower = UserFollower.for_user(current_user_id).find(params[:id])

    respond_to do |format|
      if @user_follower.update_attributes(params[:user_follower])
        format.html { redirect_to @user_follower, notice: 'User follower was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_follower.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_followers/1
  # DELETE /user_followers/1.json
  def destroy
    @user_follower = UserFollower.for_user(current_user_id).find(params[:id])
    @user_follower.destroy

    respond_to do |format|
      format.html { redirect_to user_followers_url }
      format.json { head :no_content }
    end
  end
  
  protected

  def user_follower_params
    params.require(:user_follower).permit(:uid)
  end
end
