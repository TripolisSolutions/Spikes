class FacebookPostsController < ApplicationController
  # GET /facebook_posts
  # GET /facebook_posts.json
  def index
    @facebook_posts = FacebookPost.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @facebook_posts }
    end
  end

  # GET /facebook_posts/1
  # GET /facebook_posts/1.json
  def show
    @facebook_post = FacebookPost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @facebook_post }
    end
  end

  def audit
    @facebook_post = FacebookPost.find(params[:id])
    @audits = @facebook_post.audits

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: {facebook_post: @facebook_post, audits: @audits} }
    end
  end

  # GET /facebook_posts/new
  # GET /facebook_posts/new.json
  def new
    @facebook_post = FacebookPost.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @facebook_post }
    end
  end

  # GET /facebook_posts/1/edit
  def edit
    @facebook_post = FacebookPost.find(params[:id])
  end

  # POST /facebook_posts
  # POST /facebook_posts.json
  def create
    @facebook_post = FacebookPost.new(facebook_post_params)

    respond_to do |format|
      if @facebook_post.save
        format.html { redirect_to @facebook_post, notice: 'Facebook post was successfully created.' }
        format.json { render json: @facebook_post, status: :created, location: @facebook_post }
      else
        format.html { render action: "new" }
        format.json { render json: @facebook_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /facebook_posts/1
  # PATCH/PUT /facebook_posts/1.json
  def update
    @facebook_post = FacebookPost.find(params[:id])

    respond_to do |format|
      if @facebook_post.update_attributes(facebook_post_params)
        format.html { redirect_to @facebook_post, notice: 'Facebook post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @facebook_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facebook_posts/1
  # DELETE /facebook_posts/1.json
  def destroy
    @facebook_post = FacebookPost.find(params[:id])
    @facebook_post.destroy

    respond_to do |format|
      format.html { redirect_to facebook_posts_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def facebook_post_params
      params.require(:facebook_post).
        permit(:account_id, :post_at, :status, :type, :label,
               :url, :message, :name, :description, :event, :location, :when, :question #stored
               )
    end
end
