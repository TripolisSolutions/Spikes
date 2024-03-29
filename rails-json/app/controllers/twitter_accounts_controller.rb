class TwitterAccountsController < ApplicationController
  # GET /twitter_accounts
  # GET /twitter_accounts.json
  def index
    @twitter_accounts = TwitterAccount.find(:all)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @twitter_accounts }
    end
  end

  # GET /twitter_accounts/1
  # GET /twitter_accounts/1.json
  def show
    @twitter_account = TwitterAccount.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @twitter_account }
    end
  end

  # GET /twitter_accounts/new
  # GET /twitter_accounts/new.json
  def new
    @twitter_account = TwitterAccount.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @twitter_account }
    end
  end

  # GET /twitter_accounts/1/edit
  def edit
    @twitter_account = TwitterAccount.find(params[:id])
  end

  # POST /twitter_accounts
  # POST /twitter_accounts.json
  def create

    @twitter_account = TwitterAccount.new(params["twitter_account"])

    success = @twitter_account.save

    respond_to do |format|
      if success
        format.html { redirect_to twitter_accounts_url }
        format.json { render json: @twitter_account, status: :created, location: @twitter_account }
      else
        format.html { render action: "new" }
        format.json { render json: @twitter_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /twitter_accounts/1
  # PUT /twitter_accounts/1.json
  def update
    @twitter_account = TwitterAccount.find(params[:id])

    respond_to do |format|
      if @twitter_account.update_attributes(params[:twitter_account])
        format.html { redirect_to @twitter_account, notice: 'Twitter account was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @twitter_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /twitter_accounts/1
  # DELETE /twitter_accounts/1.json
  def destroy
    @twitter_account = TwitterAccount.find(params[:id])
    @twitter_account.destroy

    respond_to do |format|
      format.html { redirect_to twitter_accounts_url }
      format.json { head :no_content }
    end
  end
end
