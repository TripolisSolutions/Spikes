require_relative '../../app/helpers/dynamic_database'
require 'dm-core'

Admin.controllers :posts do

  get :index do
    @posts = DynamicDatabase.shard(self.current_account.name) {Post.all}
    #@posts = Post.all
    render 'posts/index'
  end

  get :new do
    @post = Post.new
    render 'posts/new'
  end

  post :create do
    @post = DynamicDatabase.shard(self.current_account.name) {Post.create(params[:post])}
    if @post.save
      flash[:notice] = 'Post was successfully created.'
      redirect url(:posts, :index)
    else
      render 'posts/new'
    end
  end

  get :edit, :with => :id do
    @post = DynamicDatabase.shard(self.current_account.name) {Post.get(params[:id]) }
    render 'posts/edit'
  end

  put :update, :with => :id do
    @post = DynamicDatabase.shard(self.current_account.name) {Post.get(params[:id])       }
    if @post.update(params[:post])
      flash[:notice] = 'Post was successfully updated.'
      redirect url(:posts, :edit, :id => @post.id)
    else
      render 'posts/edit'
    end
  end

  delete :destroy, :with => :id do
    post = DynamicDatabase.shard(self.current_account.name) {Post.get(params[:id]) }
    if post.destroy
      flash[:notice] = 'Post was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy Post!'
    end
    redirect url(:posts, :index)
  end
end
