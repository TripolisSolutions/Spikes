class FacebookMessagesController < ApplicationController
  # GET /facebook_messages
  # GET /facebook_messages.json
  #
  before_filter do
    @graph = Koala::Facebook::API.new(session[:access_token])
  end

  def index
    @profile = @graph.get_object("me")
    @friends = @graph.get_connections("me", "friends?fields=name,picture")
    @facebook_messages  = params[:page] ? @graph.get_page(params[:page]) : @graph.get_connections("me", "feed")

    #pages info
    @pages = Array.new
    pages = @graph.get_connection('me','accounts').each do |page|
      if page['category'] == "Community"
        @pages.push page
      end
    end
    first_page_token = @pages.first['access_token']

    @page_graph = Koala::Facebook::API.new(first_page_token)

    @my_page = @page_graph.get_object('me') # I'm a page
    @my_page_posts = @page_graph.get_connection('me', 'feed') # the page's wall
    @my_page_likes = @page_graph.get_connections(@my_page['username'], "likes")
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /facebook_messages/1
  # GET /facebook_messages/1.json
  def show
    @facebook_message = @graph.get_object(params[:id])

    respond_to do |format|
      format.html # show.html.erb

    end
  end

  # GET /facebook_messages/new
  # GET /facebook_messages/new.json
  def new
    @facebook_message = FacebookMessage.new
    respond_to do |format|
      format.html # new.html.erb
    end
  end


  # POST /facebook_messages
  # POST /facebook_messages.json
  def create

    @facebook_message = FacebookMessage.new(params[:facebook_message])
    if @facebook_message.valid?
      pages = @graph.get_connection('me','accounts')
      first_page_token = pages.first['access_token']

      @page_graph = Koala::Facebook::API.new(first_page_token)

      @page_graph.get_object('me') # I'm a page
      @page_graph.get_connection('me', 'feed') # the page's wall
      @wall_post = @page_graph.put_wall_post(@facebook_message.message) # post as page, requires publish_stream permission

      respond_to do |format|
        format.html { redirect_to @facebook_message, notice: 'Facebook message was successfully created.' }
      end
      else
      respond_to do |format|
        format.html {  render action: "new" }
      end
    end

  end


  # DELETE /facebook_messages/1
  # DELETE /facebook_messages/1.json
  def destroy
    @graph.delete_object(params[:id])

    respond_to do |format|
      format.html { redirect_to :back, notice: 'Facebook message was successfully deleted.' }
    end
  end

  #Oauth routes just for now in messages controller

  def redirect
    @oauth = Koala::Facebook::OAuth.new("http://localhost.com:3000/oauth/")
    @oauth.url_for_oauth_code(:permissions => "publish_stream")
    session[:access_token] = @oauth.get_access_token(params[:code]) if params[:code]
    redirect_to session[:access_token] ? facebook_messages_path : :login
  end

  def login
    @oauth_callback_url = "http://localhost.com:3000/oauth/"
    render :login
  end
end
