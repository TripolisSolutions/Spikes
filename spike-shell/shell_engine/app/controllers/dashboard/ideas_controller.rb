class Dashboard::IdeasController < DashboardController

  load_and_authorize_resource

  # GET /ideas
  # GET /ideas.json
  def index
    @ideas = Idea.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ideas }
    end
  end

  # GET /idea/1
  # GET /idea/1.json
  def show
    @idea = Idea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @idea }
    end
  end

  # POST /idea
  # POST /idea.json
  def create
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy

    respond_to do |format|
      format.html { redirect_to dashboard_ideas_url }
      format.json { head :no_content }
    end
  end
end
