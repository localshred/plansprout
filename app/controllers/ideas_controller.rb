class IdeasController < ApplicationController
  before_filter :login_required
  
  def index
    @ideas = Idea.find_all_by_user_id current_user, :order => "title"

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ideas }
    end
  end

  def show
    @idea = Idea.find(params[:id])
    @notes = Note.find_all_by_idea_id(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @idea }
    end
  end

  def search
    @idea = Idea.find(:all, :where => ["lower(title) LIKE '%:keywords%' OR lower(description) LIKE '%:keywords%'", { "keywords" => params[:keywords].downcase } ])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @idea }
    end
  end # def search

  def new
    @idea = Idea.new
    @idea.user_id = current_user.id

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @idea }
    end
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def create
    @idea = Idea.new(params[:idea])

    respond_to do |format|
      if @idea.save
        flash[:notice] = 'Idea was successfully created.'
        format.html { redirect_to(@idea) }
        format.xml  { render :xml => @idea, :status => :created, :location => @idea }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @idea.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @idea = Idea.find(params[:id])

    respond_to do |format|
      if @idea.update_attributes(params[:idea])
        flash[:notice] = 'Idea was successfully updated.'
        format.html { redirect_to(@idea) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @idea.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy

    respond_to do |format|
      format.html { redirect_to(ideas_url) }
      format.xml  { head :ok }
    end
  end
end
