class UserFollowersController < ApplicationController
  before_filter :login_required
  
  # POST /user_followers
  # POST /user_followers.json
  def create
    @user_follower = UserFollower.new(user_follower_params)
    @user_follower.user_id = current_user_id

    respond_to do |format|
      if @user_follower.save
        format.html { redirect_to root_path }
        format.json { render json: @user_follower, status: :created, location: @user_follower }
      else
        format.html { render action: "new" }
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
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end

  def followers
    @user_follower = UserFollower.for_user(current_user_id).find(params[:id])
    @followers = UserFollowersContact.where(user_follower_id: @user_follower.id).
      preload(:contact).
      page(params[:page])
  end
  
  protected

  def user_follower_params
    params.require(:user_follower).permit(:twitter_id)
  end
end
