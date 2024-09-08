class EventsController < ApplicationController
  def index
    @events = Event.all
    render :index
  end

  def create
    @event = Event.create(
      name: params[:name],
      date: params[:date],
      description: params[:description]
    )
    if @event.save
      render :show
    else
      render json: {errors: @event.errors.full_messages}, status: :bad_request
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
    render :show
  end
end
