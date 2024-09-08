class VolunteerHoursController < ApplicationController
  def index
    @volunteer_hours = VolunteerHour.all
    render :index
  end

  def create
    @volunteer_hour = VolunteerHour.create(
      user_id: params[:user_id],
      event_id: params[:event_id],
      hours: params[:hours],
      date: params[:date]
    )
    if @volunteer_hour.save
      render :show
    else
      render json: {errors: @volunteer_hour.errors.full_messages}, status: :bad_request
    end
  end

  def show
    @volunteer_hour = VolunteerHour.find_by(id: params[:id])
    render :show
  end
end
