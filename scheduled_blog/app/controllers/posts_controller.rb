require 'rubygems'

class PostsController < ApplicationController

  http_basic_authenticate_with :name => "jeroen", :password => "jeroen", :except => [:index, :show]

  # GET /posts
  # GET /posts.json
  def index
    #@posts = Post.all
    @posts = Post.getVisible('t')
    all_invisible_posts = Post.getVisible('f')
    @scheduled_posts = []

    @invisible_posts = []

    all_invisible_posts.each do |inv_post|
         job = @@scheduler.find_by_tag(inv_post.id.to_s)
         puts "job class: "+job[0].class.to_s

          if !job[0].nil?
            puts "scheduled job: "+job[0].inspect
            inv_post.scheduled_job = job[0]
            @scheduled_posts <<  inv_post
          else
            @invisible_posts <<  inv_post
          end

    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  def unschedule

    id= params[:id]
    job = @@scheduler.find_by_tag(id.to_s)

    if !job[0].nil?
      job[0].unschedule
    end

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])

    success = @post.save

    embargo = @post.publish_at.strftime("%a %b %d %H:%M:%S") + " +0100 " + @post.publish_at.strftime("%Y")

    if success
      testJob = @@scheduler.at embargo, :tags => @post.id.to_s do
        puts "Setting visible to true..."
        @post.visible = true
        @post.save
      end
    end



    respond_to do |format|
      if success

          format.html { redirect_to @post, notice: 'Post was successfully created.' }
          format.json { render json: @post, status: :created, location: @post }

      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json



  def update
    @post = Post.find(params[:id])

    temp_post = Post.new(params[:post])
    embargo = temp_post.publish_at.strftime("%a %b %d %H:%M:%S") + " +0100 " + temp_post.publish_at.strftime("%Y")

    puts "requested post date: "+ embargo

    success =  @post.update_attributes(params[:post])

    if success
      testJob = @@scheduler.at embargo, :tags => @post.id.to_s do
        puts "Setting visible to true..."
        @post = Post.find(params[:id])
        @post.visible = true
        @post.save
      end
    end

   respond_to do |format|
      if success
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end




end
