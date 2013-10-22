class DocketsController < ApplicationController
  before_action :set_docket, only: [:show, :edit, :update, :destroy, :trash_docket]

  def index
  end
  
  def new
    @docket = Docket.new
    @parsed_start_datetime = Time.at(params[:clickDate].to_i).change(:min => 0, :sec => 0)
    @parsed_end_datetime = @parsed_start_datetime.advance(:hours => 1)
  end
  
  def create
    @docket = Docket.new(docket_params)
    
    respond_to do |format|
      if @docket.save
        # format.html { redirect_to @docket, notice: 'Docket Created' }
        format.js
      else
      # format.html { render action: 'new' }
        format.js
      end
    end
  end
  
  def edit
  end
  
  def update
    respond_to do |format|
      if @docket.update(docket_params)
        format.html { redirect_to docket_path }
        format.js 
      else
        format.html { render action: 'edit' }
        format.json { render json: @docket.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show
  end
  
  def destroy
  end
  
  def get_dockets
    @dockets = Docket.where(users_id: current_user, trashed: "f")
    dockets = []
    @dockets.each do |docket|
      dockets << { :id => docket.id, :title => docket.title, :description => docket.description, :start => "#{docket.start_datetime.iso8601}", :end => "#{docket.end_datetime.iso8601}" }
    end
      render :json => dockets
  end
  
  def trash_docket
    respond_to do |format|
      if @docket.update(trashed: "t")
        docket = []
        docket << params[:id]
        format.html { redirect_to docket_path }
        format.json { render json: docket }
    else
      format.html { redirect_to docket_path }
      format.json
      end
    end
  end
  
  private
  
  def set_docket
    @docket = Docket.find(params[:id])
  end
    
  def docket_params
    params.require(:docket).permit(:title, :description, :start_datetime, :end_datetime, :users_id)
  end
end
