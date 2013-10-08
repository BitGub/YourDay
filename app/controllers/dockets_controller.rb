class DocketsController < ApplicationController

  def index
  end
  
  def new
  end
  
  def create
  end
  
  def edit
  end
  
  def update
  end
  
  def show
  end
  
  def destroy
  end
  
  def get_dockets
    
    @dockets = Docket.all
    dockets = []
    @dockets.each do |docket|
      dockets << { :id => docket.id, :title => docket.title, :description => docket.description, :start => "#{docket.start_datetime.iso8601}", :end => "#{docket.end_datetime.iso8601}" }
    end
      render :json => dockets
  end
end
