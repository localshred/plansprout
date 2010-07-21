class NotesController < ApplicationController
  before_filter :login_required, :find_parent_idea
  attr_accessor :idea

  def find_parent_idea
    @idea ||= Idea.find(params[:idea_id])
  end # def find_parent_idea

  def new
    @note = Note.new
    @note.idea_id = params[:idea_id]
    @note.user_id = current_user.id

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @note }
    end
  end

  def edit
    @idea = Idea.find(params[:idea_id])
    @note = Note.find(params[:id])
  end

  def create
    @note = Note.new(params[:note])

    respond_to do |format|
      if @note.save
        flash[:notice] = 'Note was successfully created.'
        format.html { redirect_to(@idea) }
        format.xml  { render :xml => @note, :status => :created, :location => @note }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @note.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @note = Note.find(params[:id])

    respond_to do |format|
      if @note.update_attributes(params[:note])
        flash[:notice] = 'Note was successfully updated.'
        format.html { redirect_to(@idea) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @note.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy

    respond_to do |format|
      format.html { redirect_to(@idea) }
      format.xml  { head :ok }
    end
  end
end
