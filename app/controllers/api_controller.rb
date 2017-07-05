class ApiController < ApplicationController

  before_filter :get_event, :only => [:update, :destroy]

  def create
    begin
      @event = GroupEvent.new(params[:event])
      if @event.save
        render json: {:status => 200, :message => "Thank You. Group Event was successfully Created.", :event => @event}.to_json, status: 200
      else
        render json: {:status => 422, :message => @event.errors.messages}.to_json, status: 422
      end
    rescue => e
      render json: {:status => 422, :message => "There was an error processing your request. Error: #{e}"}.to_json, status: 422
    end
  end

  def update
    begin
      if @event.update_attributes(params[:event])
        render json: {:status => 200, :message => "Thank You. Group Event was successfully Modified.", :event => @event}.to_json, status: 200
      else
        render json: {:status => 422, :message => @event.errors.messages}.to_json, status: 422
      end
    rescue => e
      render json: {:status => 422, :message => "There was an error processing your request. Error: #{e}"}.to_json, status: 422
    end
  end

  def destroy
    begin
      if @event.update_attribute(:is_achived, true)
        render json: {:status => 200, :message => "Thank You. Group Event was successfully Removed.", :event => @event}.to_json, status: 200
      else
        render json: {:status => 422, :message => @event.errors.messages}.to_json, status: 422
      end
    rescue => e
      render json: {:status => 422, :message => "There was an error processing your request. Error: #{e}"}.to_json, status: 422
    end
  end

  private

  def get_event
    @event = GroupEvent.where(:id => params[:id]).first
    render json: {:status => "404", :message => "Sorry!. Group Event was not found."}.to_json unless @event.present?
  end

end
